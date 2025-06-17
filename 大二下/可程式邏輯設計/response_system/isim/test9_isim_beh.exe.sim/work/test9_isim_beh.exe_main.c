/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000001402822762_4044053994_init();
    work_m_00000000001797359835_0468646110_init();
    work_m_00000000000884229119_3109452578_init();
    work_m_00000000003104147405_1787115069_init();
    work_m_00000000000842560478_2326473917_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000842560478_2326473917");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
