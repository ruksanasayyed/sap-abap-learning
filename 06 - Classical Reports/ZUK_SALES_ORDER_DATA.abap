*&---------------------------------------------------------------------*
*& Report ZUK_SALES_ORDER_DATA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuk_sales_order_data.

"This program is about- HOW TO VIEW LIST OF ORDERS.

TABLES: vbap, vbak.

SELECT-OPTIONS: s_vbeln for vbap-vbeln. "Sales and Distribution Document Number

PARAMETERS: p_posnr	 TYPE posnr, "Sales Document Item Number / Item number of the SD document
            p_matnr	 TYPE matnr, "Material Number
            p_kwmeng TYPE kwmeng. "Order Quantity

TYPES: BEGIN OF tp_report, "TYPES TO HOLD ALL THE DATA SUCH AS PARAM OR SELECT OPTIONS.
         p_vbeln  TYPE vbeln, "Sales and Distribution Document Number
         p_posnr   TYPE posnr, "Sales Document Item Number / Item number of the SD document
         p_matnr   TYPE matnr, "Material Number
         p_kwmeng TYPE kwmeng, "Order Quantity
         p_ERDAT   TYPE erdat, "Record Created On
         p_ernam   TYPE ernam, "Name of Person Responsible for Creating the Object
         p_netwr  TYPE netwr, "Net Value
       END OF tp_report.

DATA:gt_report TYPE TABLE OF tp_report,
     gs_report TYPE tp_report.

SELECT a~vbeln a~posnr a~matnr
       a~kwmeng b~erdat b~ernam b~netwr
  FROM vbap AS a INNER JOIN vbak AS b
  ON a~vbeln = b~vbeln
  INTO TABLE gt_report
  WHERE a~vbeln IN s_vbeln AND
        a~posnr = p_posnr AND
        a~matnr = p_matnr AND
        a~kwmeng = p_kwmeng.


WRITE: 3 'Sales Document Number', 30 'SD Item Number', 50 'Material Number', 70 'Order Quantity', 90 'Created On', 105 'Created By', 120 'Net Value'.

uline.

LOOP AT gt_report INTO gs_report.

  WRITE: /3 gs_report-p_vbeln, 30 gs_report-p_posnr, 50 gs_report-p_matnr, 70 gs_report-p_kwmeng, 90 gs_report-p_erdat, 105 gs_report-p_ernam, 120 gs_report-p_netwr LEFT-JUSTIFIED.

clear: gs_report.
ENDLOOP.