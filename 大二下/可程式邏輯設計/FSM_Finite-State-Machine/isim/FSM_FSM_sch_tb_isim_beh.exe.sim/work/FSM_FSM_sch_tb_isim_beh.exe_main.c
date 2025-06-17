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
    uni9000_ver_m_00000000003317509437_1759035934_init();
    uni9000_ver_m_00000000001566228165_4138858648_init();
    work_m_00000000001922359998_1745298861_init();
    uni9000_ver_m_00000000003960923341_1435897813_init();
    uni9000_ver_m_00000000003510477262_2316096324_init();
    work_m_00000000002696693053_4020927633_init();
    work_m_00000000002369670253_0518853031_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002369670253_0518853031");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
