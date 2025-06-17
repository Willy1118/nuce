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
    uni9000_ver_m_00000000003510477262_2316096324_init();
    uni9000_ver_m_00000000000924517765_3125220529_init();
    work_m_00000000001841627724_2779239139_init();
    uni9000_ver_m_00000000002123152668_0970595058_init();
    work_m_00000000001789035611_0992280429_init();
    work_m_00000000001835793905_3858471414_init();
    work_m_00000000000230714487_0426941032_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000230714487_0426941032");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
