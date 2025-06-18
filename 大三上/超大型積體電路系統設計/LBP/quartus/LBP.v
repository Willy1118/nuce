module LBP (clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);
//================================================================
//  INPUT & OUTPUT DECLARATION
//================================================================

// INPUT
input  clk;             // clock
input  reset;           // reset
input  gray_ready;      // Is host ready or not?
input  [7:0] gray_data; // grayscale image pixel data

// OUTPUT
output reg [13:0] gray_addr; // grayscale image pixel address
output         	gray_req;  // 1 indicates that the LBP module is requesting image data
output reg [13:0] lbp_addr;  // Local Binary Pattern Address
output reg 	      lbp_valid; // 1 indicates that the Local Binary Pattern data and address bus transmitted by the LBP module are valid
output reg [7:0]  lbp_data;  // Local Binary Pattern data
output reg	      finish;    // LBP finish its job, then set to 1

//================================================================
//  parameters (state)
//================================================================
parameter STATE_IDLE          = 3'd0; // Begin state(IDLE)
parameter STATE_INPUT_MID     = 3'd1; // Read center pixel
parameter STATE_INPUT_OUTSIDE = 3'd2; // Read the surrounding pixels of the center pixel
parameter STATE_OUTPUT        = 3'd3; // Output the LBP result 
parameter STATE_FINISH        = 3'd4; // Finished state

//================================================================
//   Wires & Registers
//================================================================
reg [2:0] cur_state, nx_state; // current state and next state
reg [6:0] y, x, y_out, x_out;  // Coordinates of the current pixel (y, x) and output pixel (y_out, x_out)
reg [3:0] cnt_in;              // Counter for iterating over the surrounding pixels (for LBP calculation)
reg [7:0] lbp_sum;             // Accumulator for storing the LBP result of the current pixel
reg [7:0] gray_mid;            // Gray value of the center pixel (gray_mid) for LBP comparison

wire   [13:0] addr_tmp[7:0];           // surrounding pixels
assign addr_tmp[7] = {y+7'd1, x+7'd1}; // bottom-right
assign addr_tmp[6] = {y+7'd1, x     }; // bottom-center
assign addr_tmp[5] = {y+7'd1, x-7'd1}; // bottom-left
assign addr_tmp[4] = {y     , x+7'd1}; // center-right
assign addr_tmp[3] = {y     , x-7'd1}; // center-left
assign addr_tmp[2] = {y-7'd1, x+7'd1}; // top-right
assign addr_tmp[1] = {y-7'd1, x     }; // top-center
assign addr_tmp[0] = {y-7'd1, x-7'd1}; // top-left 

wire   [7:0] idata_buf, lpb_mul;                   // Temporary buffers for LBP data and weighted values
assign idata_buf = (gray_mid > gray_data) ? 0 : 1; // Compare center pixel (gray_mid) with surrounding (gray_data)
assign lpb_mul   = idata_buf << (cnt_in - 2'd1);   // Shift idata_buf for LBP weight calculation

assign gray_req = (cur_state == STATE_INPUT_MID || cur_state == STATE_INPUT_OUTSIDE); // Request gray data when in input states


//================================================================
//  Unified Always Block
//================================================================
always @(posedge clk or posedge reset) begin
    if (reset) begin
	     // begin state
        cur_state <= STATE_IDLE;
			
        gray_mid <= 0;

        // Address & counters
        gray_addr <= 0;
        cnt_in <= 0;
        lbp_sum <= 0;

        // Output signals
        finish <= 0;
        lbp_valid <= 0;
        lbp_addr <= 0;
        lbp_data <= 0;

        // Coordinates
        x <= 1;
        y <= 1;
        x_out <= 1;
        y_out <= 1;
    end 
	 else begin
        cur_state <= nx_state;

        // Update gray_mid
        if (cur_state == STATE_INPUT_MID) begin
            gray_mid <= gray_data;
        end

        // Update cnt_in
        if (nx_state == STATE_INPUT_OUTSIDE) begin
            cnt_in <= cnt_in + 1;
        end 
		  else begin
            cnt_in <= 0;
        end

        // Calculate lbp_sum
        if (cur_state == STATE_INPUT_OUTSIDE) begin
            if (cnt_in == 1) begin
                lbp_sum <= idata_buf;
            end 
				else if (cnt_in > 1) begin
                lbp_sum <= lbp_sum + lpb_mul;
            end
        end

        // Update gray_addr
        if (nx_state == STATE_INPUT_MID) begin
            gray_addr <= {y, x};
        end 
		  else if (nx_state == STATE_INPUT_OUTSIDE) begin
            if (cnt_in < 8) begin
                gray_addr <= addr_tmp[cnt_in];
            end
        end

        // Finish signal
        finish <= (cur_state == STATE_FINISH);

        // lbp_valid and lbp_data
        if (cur_state == STATE_OUTPUT) begin
            lbp_valid <= 1;
            lbp_addr  <= {y_out, x_out};
            lbp_data  <= lbp_sum;
        end 
		  else begin
            lbp_valid <= 0;
        end

        // Update x and y coordinates
        if (nx_state == STATE_OUTPUT) begin
            if (x == 126) begin
                x <= 1;
                y <= y + 1;
            end 
				else begin
                x <= x + 1;
            end
        end

        // Update x_out and y_out
        x_out <= x;
        y_out <= y;
    end
end

//================================================================
//  Next State Logic
//================================================================
always @(*) begin
    case (cur_state)
        STATE_IDLE: 
            nx_state = (gray_ready) ? STATE_INPUT_MID : STATE_IDLE;
        STATE_INPUT_MID: 
            nx_state = STATE_INPUT_OUTSIDE;
        STATE_INPUT_OUTSIDE: 
            nx_state = (cnt_in == 8) ? STATE_OUTPUT : STATE_INPUT_OUTSIDE;
        STATE_OUTPUT: 
            nx_state = (y_out == 126 && x_out == 126) ? STATE_FINISH : STATE_INPUT_MID;
        STATE_FINISH: 
            nx_state = STATE_FINISH;
        default: 
            nx_state = STATE_IDLE;
    endcase
end

endmodule
