If (False:C215)
	//object Name: [INVOICES]dask_oINVSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/03/2010 06:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SI_lb_LBCont;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; SI_t_InvoiceNo)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dask_Invoices.oINVSelect"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			SI_t_InvoiceNo:=GEN_at_RecordCode{$_l_Row}
			
			ACCEPT:C269
		Else 
			LISTBOX SELECT ROW:C912(SI_lb_LBCont; 1; 0)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [INVOICES].dask_Invoices.oINVSelect"; $_t_oldMethodName)
