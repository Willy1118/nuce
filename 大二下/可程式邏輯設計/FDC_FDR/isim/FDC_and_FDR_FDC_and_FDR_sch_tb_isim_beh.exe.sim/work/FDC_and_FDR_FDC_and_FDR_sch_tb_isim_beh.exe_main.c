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
    work_m_00000000003758100297_0259433058_init();
    uni9000_ver_m_00000000003960923341_1435897813_init();
    work_m_00000000001922359998_0202148051_init();
    work_m_00000000000797650037_3678941968_init();
    work_m_00000000003550427365_1678803251_init();
    work_m_00000000001384274741_0526568493_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001384274741_0526568493");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
