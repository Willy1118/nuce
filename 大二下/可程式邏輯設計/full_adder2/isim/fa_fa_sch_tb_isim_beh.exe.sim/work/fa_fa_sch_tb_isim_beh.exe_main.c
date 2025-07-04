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
    uni9000_ver_m_00000000004258808807_3443532839_init();
    uni9000_ver_m_00000000003510477262_2316096324_init();
    uni9000_ver_m_00000000001162476414_1323117156_init();
    work_m_00000000001166577998_0992280429_init();
    work_m_00000000003667986520_3745294612_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003667986520_3745294612");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
