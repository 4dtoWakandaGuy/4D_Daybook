//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_CHART
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 15:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($5; $6)
	C_REAL:C285($10; $11; $8; $9)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2; $3; $4; $7)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_CHART")
Case of 
	: ($1="Copy_Picture")
		
		//set the chart as picture to pasteboard
		SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $2)
		SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $3)
		SCPT_XL_SetParameter("XCEL_CHART_NAME"; $4)
		SCPT_XL_SetParameter("XCEL_PICTURE_APPEARANCE"; String:C10($5))
		SCPT_XL_SetParameter("XCEL_PICTURE_FORMAT"; String:C10($6))
		
		SCPT_XL("range_chart_copy_picture")
	: ($1="Count")
		
		SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
		SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $2)
		
		$0:=(SCPT_XL("range_chart_count"))
	: ($1="Create")
		
		//`````
		//TEXT($5)
		//``
		
		SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $2)
		SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $3)
		SCPT_XL_SetParameter("XCEL_RANGE"; $4)
		SCPT_XL_SetParameter("XCEL_CHART_TITLE"; $7)
		SCPT_XL_SetParameter("XCEL_CHART_LEFT"; String:C10($8))
		SCPT_XL_SetParameter("XCEL_CHART_TOP"; String:C10($9))
		SCPT_XL_SetParameter("XCEL_CHART_WIDTH"; String:C10($10))
		SCPT_XL_SetParameter("XCEL_CHART_HEIGHT"; String:C10($11))
		
		$0:=SCPT_XL("range_chart_create")
	: ($1="Get_Name")
		//``
		//```
		
		SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $2)
		SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $3)
		SCPT_XL_SetParameter("XCEL_CHART_NUMBER"; String:C10($5))
		
		$0:=SCPT_XL("range_chart_get_name")
	: ($1="Set_name")
		//``
		
		
		SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $2)
		SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $3)
		If (Count parameters:C259>=5)
			SCPT_XL_SetParameter("XCEL_CHART_NUMBER"; String:C10($5))
		End if 
		SCPT_XL_SetParameter("XCEL_CHART_NAME"; $4)
		SCPT_XL("range_chart_set_name")
	: ($1="Get_Type")
		
		SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $2)
		SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $3)
		SCPT_XL_SetParameter("XCEL_CHART_NAME"; $4)
		
		$0:=(SCPT_XL("range_chart_get_type"))
	: ($1="Set_Type")
		
		SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $2)
		SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $3)
		SCPT_XL_SetParameter("XCEL_CHART_NAME"; $4)
		SCPT_XL_SetParameter("XCEL_CHART_TYPE"; String:C10($5))
		
		SCPT_XL("range_chart_set_type")
	: ($1="Set_Type")
End case 
ERR_MethodTrackerReturn("SCPT_XL_CHART"; $_t_oldMethodName)
