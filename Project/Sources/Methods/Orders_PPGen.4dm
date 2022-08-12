//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPGen
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   22/11/2010 23:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	C_BOOLEAN:C305($_bo_ALActive; $_bo_Reselect; $11; SR_bo_Validated)
	C_LONGINT:C283($_l_OrderItemsRow; $_l_Printed; $_l_RecordsState; $7)
	C_POINTER:C301($_ptr_HighlightSet; $_ptr_ListBoxSetup; $_ptr_OrderTable; $_ptr_RecordStateField; $1; $8; BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_CurrentWindowTitle; $_t_DocumentCode; $_t_DocumentName; $_t_FormDialog; $_t_FormNameInput; $_t_FormNameOutput; $_t_HighlightSetName; $_t_NamedSet; $_t_oldMethodName; $_t_PrintExecutionCode; $_t_SRAnalysisCode)
	C_TEXT:C284($_t_SRDocumentCode; $10; $2; $3; $4; $5; $6; $9; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPGen")
SR_bo_Validated:=False:C215
$_ptr_OrderTable:=$1
$_t_FormNameInput:=$2
$_t_FormNameOutput:=$3
$_t_FormDialog:=$4
$_t_DocumentCode:=$5
$_t_PrintExecutionCode:=$6
$_l_RecordsState:=0
$_t_SRDocumentCode:=""
$_t_SRAnalysisCode:=""
$_t_DocumentName:="Order "+[ORDERS:24]Order_Code:3  // 05/04/04 pb
Case of 
	: (Count parameters:C259=7)
		$_l_RecordsState:=$7
	: (Count parameters:C259=8)
		$_l_RecordsState:=$7
		$_ptr_RecordStateField:=$8
		//Optional SR Pro Document Code to find
	: (Count parameters:C259=9)
		$_l_RecordsState:=$7
		$_ptr_RecordStateField:=$8
		$_t_SRDocumentCode:=$9
	: (Count parameters:C259=10)
		$_l_RecordsState:=$7
		$_ptr_RecordStateField:=$8
		$_t_SRDocumentCode:=$9
		$_t_SRAnalysisCode:=$10
	: (Count parameters:C259=11)
		$_l_RecordsState:=$7
		$_ptr_RecordStateField:=$8
		$_t_SRDocumentCode:=$9
		$_t_SRAnalysisCode:=$10
		$_bo_ALActive:=$11
End case 

//Optional SR Pro Document Code to find


Case of 
	: (BUT_p_ButtonStringPointer->="OI@")
		If (Orders_PPOut1(False:C215))
			If (Orders_PPChCo)
				Gen_PPMulti($_ptr_OrderTable; $_t_FormNameInput; $_t_FormNameOutput; $_t_FormDialog; $_t_DocumentCode; $_t_PrintExecutionCode; $_l_RecordsState; $_ptr_RecordStateField; $_t_SRDocumentCode; $_t_SRAnalysisCode; $_bo_ALActive; $_t_DocumentName)  // 05/04/04 pb
			End if 
		End if 
		Orders_PPOut2
	: (BUT_p_ButtonStringPointer->="OO@")
		Gen_PPMulti($_ptr_OrderTable; $_t_FormNameInput; $_t_FormNameOutput; $_t_FormDialog; $_t_DocumentCode; $_t_PrintExecutionCode; $_l_RecordsState; $_ptr_RecordStateField; $_t_SRDocumentCode; $_t_SRAnalysisCode; $_bo_ALActive; $_t_DocumentName)  // 05/04/04 pb
		
	: (BUT_p_ButtonStringPointer->="IO@")
		If (In_ButtChkMan(->[ORDERS:24]; "1 3"))
			COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
			DB_SaveRecord(->[ORDER_ITEMS:25])
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
			$_bo_Reselect:=False:C215
			$_t_NamedSet:=""
			If (DB_t_CurrentFormUsage#"None")
				$_l_OrderItemsRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
				
				If ($_l_OrderItemsRow>0)
					$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_OrderItemsRow}
					
					$_ptr_HighlightSet:=$_ptr_ListBoxSetup->{20}
					$_t_HighlightSetName:=$_ptr_HighlightSet->
					$_bo_Reselect:=False:C215
					If ($_t_HighlightSetName#"")
						If (Records in set:C195($_t_HighlightSetName)>0)
							USE SET:C118($_t_HighlightSetName)
							CREATE SET:C116([ORDER_ITEMS:25]; "$Reselection")
							$_bo_Reselect:=True:C214
						End if 
					End if 
				End if 
			Else 
				$_bo_Reselect:=False:C215
			End if 
			$_t_CurrentWindowTitle:=Get window title:C450
			SET WINDOW TITLE:C213($_t_DocumentName)
			$_l_Printed:=Gen_PPSingle($_ptr_OrderTable; $_t_FormNameInput; $_t_FormNameOutput; $_t_FormDialog; $_t_DocumentCode; $_t_PrintExecutionCode; $_l_RecordsState; $_ptr_RecordStateField; $_t_SRDocumentCode; $_t_SRAnalysisCode; $_bo_ALActive; $_t_DocumentName)  // 05/04/04 pb
			SET WINDOW TITLE:C213($_t_CurrentWindowTitle)
			USE NAMED SELECTION:C332("$Temp")
			
			If ($_bo_Reselect)
				HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
			End if 
			Orders_InLPBDA
		End if 
End case 
ERR_MethodTrackerReturn("Orders_PPGen"; $_t_oldMethodName)