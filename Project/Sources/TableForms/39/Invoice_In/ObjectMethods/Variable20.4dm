If (False:C215)
	//object Name: [INVOICES]Invoices_In.Variable20
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 10:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(INV_al_EditMode;0)
	//ARRAY LONGINT(INV_al_ViewTabsSettings;0)
	//ARRAY POINTER(INV_aptr_ListboxSetup;0)
	//ARRAY TEXT(INV_at_EditMode;0)
	//ARRAY TEXT(INV_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_Switch; $_bo_Update)
	C_PICTURE:C286(INV_Pi_Mode)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoices_In.Variable20"; Form event code:C388)
$_bo_Update:=(INV_al_EditMode{INV_at_EditMode}=3)
If ([INVOICES:39]Posted_Date:8#!00-00-00!) | ([INVOICES:39]State:10>=1)
	
	$_bo_Switch:=False:C215
Else 
	$_bo_Switch:=True:C214
	If (INV_al_EditMode{INV_at_EditMode}=-1)
		Case of 
			: (INV_al_ViewTabsSettings{INV_at_ViewTabsLabels}=3)
				
				$_bo_Switch:=False:C215
				//COM_at_editMode:=1
			Else 
				$_bo_Switch:=True:C214
		End case 
	End if 
End if 

LBi_EditListLay(->INV_aptr_ListboxSetup; ->INV_at_EditMode; ->INV_Pi_Mode; ->INV_al_EditMode; $_bo_Switch)
If (OK=1) & ($_bo_Update)
	QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
	LBi_RemoveAll(->INV_aptr_ListboxSetup)
	ARRAY POINTER:C280(INV_aptr_ListboxSetup; 0)
	Invoices_InLPß("P1")
End if 
ERR_MethodTrackerReturn("OBJ:Invoices_In,LB_S11_invMode"; $_t_oldMethodName)
