If (False:C215)
	//object Name: [COMPANIES]dAsk_CFCalc.oLBFieldValues
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2012 18:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_LONGINT:C283($_l_event; $_l_Row)
	C_TEXT:C284($_t_oldMethodName; vTitle10; vTitle11)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_CFCalc.oLBFieldValues"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_Row:=Self:C308->
		vTitle10:="FIELD: "+GEN_at_Identity{$_l_Row}
		vTitle11:=GEN_at_RecordCode{$_l_Row}
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_CFCalc.oLBFieldValues"; $_t_oldMethodName)
