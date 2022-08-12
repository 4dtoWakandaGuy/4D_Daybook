//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_QAdd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(ORD_ar_QuickAddQuantity;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdCode;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdName;0)
	//ARRAY TEXT(ORD_AT_QuickAddSerialNo;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages_QAdd")
//JobsStages QAdd
//NG April 2004 removed reference to ◊screen
If (FORM Get current page:C276#1)
	QuickAdd_Start
	
	If (OK=1)
		$_l_SizeofArray:=Size of array:C274(ORD_AT_QuickAddProdCode)
		For ($_l_Index; 1; $_l_SizeofArray)
			If (((ORD_AT_QuickAddProdCode{$_l_Index}#"") | (ORD_AT_QuickAddProdName{$_l_Index}#"")) & (ORD_ar_QuickAddQuantity{$_l_Index}#0))
				CREATE RECORD:C68([ORDER_ITEMS:25])
				If (DB_t_CurrentFormUsage3="JobB")
					[ORDER_ITEMS:25]State:46:="B"
				End if 
				DB_t_CurrentFormUsage:="Job"
				OrderI_SubLPB
				[ORDER_ITEMS:25]Job_Stage:35:=[JOB_STAGES:47]Stage_Code:2
				[ORDER_ITEMS:25]Quantity:3:=ORD_ar_QuickAddQuantity{$_l_Index}
				[ORDER_ITEMS:25]Product_Code:2:=ORD_AT_QuickAddProdCode{$_l_Index}
				RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
				OrderI_SubLPPC
				[ORDER_ITEMS:25]Product_Name:13:=ORD_AT_QuickAddProdName{$_l_Index}
				[ORDER_ITEMS:25]Serial_Number:24:=ORD_AT_QuickAddSerialNo{$_l_Index}
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
				
			End if 
		End for 
		If (FORM Get current page:C276=2)
			JobStages_InLOI("B")
		Else 
			If (FORM Get current page:C276=3)
				JobStages_InLOI("A")
			End if 
		End if 
		DB_bo_RecordModified:=True:C214
	End if 
	QuickAdd_Arr(0)
	
Else 
	Gen_Alert("Please first move to one of the Cost Items Pages"; "Cancel")
End if 
ERR_MethodTrackerReturn("JobStages_QAdd"; $_t_oldMethodName)