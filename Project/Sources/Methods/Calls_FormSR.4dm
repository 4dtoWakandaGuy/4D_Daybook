//%attributes = {}
If (False:C215)
	//Project Method Name:      Calls_FormSR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array Text(GEN_at_RecordCode;0)
	//_o_Array Text(GEN_at_Identity;0)
	//array Text(GEN_at_Name;0)
	//ARRAY TEXT(SVS_at_PreviewDateString;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	//ARRAY TEXT(SVS_at_PreviewNote;0)
	//ARRAY TEXT(SVS_at_PreviewTypeN;0)
	C_LONGINT:C283($_l_Index; $_l_RecordsInSelection; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2; $1; $_t_Comments; $This; vComments; vDesc)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Calls_FormSR")

//Calls_FormSR

vDesc:=""
If ($1#"")
	$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+$1)
	EXECUTE METHOD:C1007($1)
	//EXECUTE FORMULA($1)
End if 
If (Not:C34(End selection:C36([SERVICE_CALLS:20])))
	vComments:=""
	FIRST RECORD:C50([ORDER_ITEMS:25])
	CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "Base")
	Form_SRArray(0)
	Orders_FormSR3(0; (Count parameters:C259=1))
	FIRST RECORD:C50([ORDER_ITEMS:25])
	QUERY:C277([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8=[SERVICE_CALLS:20]Call_Code:4)
	
	$_l_RecordsInSelection:=Records in selection:C76([SERVICE_CALLS_PRODUCTS:152])
	Array_LCx($_l_RecordsInSelection)
	ARRAY TEXT:C222(SVS_at_PreviewNote; $_l_RecordsInSelection)
	ARRAY TEXT:C222(SVS_at_PreviewTypeN; $_l_RecordsInSelection)
	ARRAY TEXT:C222(SVS_at_PreviewEvent; $_l_RecordsInSelection)
	ARRAY TEXT:C222(SVS_at_PreviewDateString; $_l_RecordsInSelection)
	$_l_Index:=1
	FIRST RECORD:C50([SERVICE_CALLS_PRODUCTS:152])
	While (Not:C34(End selection:C36([SERVICE_CALLS_PRODUCTS:152])))
		GEN_at_Identity{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]Product_Code:1
		GEN_at_Name{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]Product_Name:5+" ("+[SERVICE_CALLS_PRODUCTS:152]System:4+")"
		SVS_at_PreviewTypeN{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]Serial_Number:2
		SVS_at_PreviewEvent{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]Contract_Code:3
		If ([SERVICE_CALLS_PRODUCTS:152]Contract_Code:3#[CONTRACTS:17]Contract_Code:3)
			RELATE ONE:C42([SERVICE_CALLS_PRODUCTS:152]Contract_Code:3)
		End if 
		SVS_at_PreviewNote{$_l_Index}:=[CONTRACTS:17]Contract_Type_Code:4
		SVS_at_PreviewDateString{$_l_Index}:=String:C10([CONTRACTS:17]Start_Date:5; "Short")
		GEN_at_RecordCode{$_l_Index}:=String:C10([CONTRACTS:17]End_Date:6; "Short")
		$_l_Index:=$_l_Index+1
		NEXT RECORD:C51([SERVICE_CALLS_PRODUCTS:152])
	End while 
	
End if 
ERR_MethodTrackerReturn("Calls_FormSR"; $_t_oldMethodName)