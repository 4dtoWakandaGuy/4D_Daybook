If (False:C215)
	//object Name: [INVOICES]Invoices_In.oListBoxAuths
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(INV_al_AuthStatus;0)
	//ARRAY TEXT(INV_at_CCAuth;0)
	C_LONGINT:C283($_l_event; $_l_SelectedRow; bVoid)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoices_In.oListBoxAuths"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_SelectedRow:=Self:C308->
//INV_at_CCAuth:=0
Case of 
	: ($_l_event=On Double Clicked:K2:5)
		
	: ($_l_event=On Clicked:K2:4)
		If ($_l_SelectedRow>0)
			INV_at_CCAuth:=$_l_SelectedRow
			Case of 
				: (INV_al_AuthStatus{$_l_SelectedRow}=1) | (INV_al_AuthStatus{$_l_SelectedRow}>=3)  // Awating invoicing
					OBJECT SET VISIBLE:C603(bVoid; True:C214)
					OBJECT SET ENABLED:C1123(bVoid; True:C214)
				Else 
					OBJECT SET VISIBLE:C603(bVoid; False:C215)
					OBJECT SET ENABLED:C1123(bVoid; False:C215)
					
			End case 
		Else 
			OBJECT SET VISIBLE:C603(bVoid; False:C215)
			OBJECT SET ENABLED:C1123(bVoid; False:C215)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [INVOICES].Invoices_In.oListBoxAuths"; $_t_oldMethodName)
