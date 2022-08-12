If (False:C215)
	//object Name: [CONTRACTS]Contract_in.Tab Control1
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
	//ARRAY LONGINT(CON_al_EditMode;0)
	//ARRAY LONGINT(CONT_al_ViewTabsSettings;0)
	//ARRAY POINTER(SVS_aptr_ListboxSetup;0)
	//ARRAY TEXT(CON_at_EditMode;0)
	//ARRAY TEXT(CONT_at_ViewTabsLabels;0)
	C_LONGINT:C283($_l_event; CON_l_editMode; vCT)
	C_PICTURE:C286(CON_pic_ModePict)
	C_TEXT:C284($_t_Function; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].Contract_in.Tab Control1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		vCT:=0
		
		$_t_Function:="P"+String:C10(1)
		// there could be saving to do?
		If ([ORDER_ITEMS:25]Description:44#"")
			DB_SaveRecord(->[ORDER_ITEMS:25])
			AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
		End if 
		
		LBi_RemoveAll(->SVS_aptr_ListboxSetup)
		ARRAY POINTER:C280(SVS_aptr_ListboxSetup; 0)
		Contracts_inLPß($_t_Function)
		
		Case of 
			: (CONT_al_ViewTabsSettings{CONT_at_ViewTabsLabels}=3)  //no edit
				If (CON_al_EditMode{1}=-1)  //already no edit
					
					CON_l_editMode:=1
					LBi_EditListLay(->SVS_aptr_ListboxSetup; ->CON_at_EditMode; ->CON_pic_ModePict; ->CON_al_EditMode)
				Else 
					LBi_EditListLay(->SVS_aptr_ListboxSetup; ->CON_at_EditMode; ->CON_pic_ModePict; ->CON_al_EditMode; True:C214)
				End if 
			Else   // it is editable
				If (COn_al_EditMode{1}=2)  // already edit
					//set the highlight here
					LBi_EditListLay(->SVS_aptr_ListboxSetup; ->CON_at_EditMode; ->CON_pic_ModePict; ->CON_al_EditMode)
				Else 
					LBi_EditListLay(->SVS_aptr_ListboxSetup; ->CON_at_EditMode; ->CON_pic_ModePict; ->CON_al_EditMode; True:C214)
				End if 
				
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [CONTRACTS].Contract_in.Tab Control1"; $_t_oldMethodName)
