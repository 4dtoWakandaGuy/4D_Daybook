If (False:C215)
	//object Name: Object Name:      PROMANAGER.oExit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/01/2011 23:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRO_abo_DataChanged;0)
	//ARRAY LONGINT(PRO_al_ItemNumbers;0)
	//ARRAY TEXT(PRO_at_Descriptions;0)
	//ARRAY TEXT(PRO_at_Stages;0)
	C_LONGINT:C283($_l_ChangedIndex; $_l_ChangedRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PROMANAGER.oExit"; Form event code:C388)
$_l_ChangedRow:=Find in array:C230(PRO_abo_DataChanged; True:C214)
If ($_l_ChangedRow>0)
	Gen_Confirm("Do you wish to save the changes you made?"; "Yes"; "No")
	If (OK=1)
		READ WRITE:C146([ORDER_ITEMS:25])
		COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$CURRENT")
		For ($_l_ChangedIndex; 1; Size of array:C274(PRO_al_ItemNumbers))
			If (PRO_abo_DataChanged{$_l_ChangedIndex})
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=PRO_al_ItemNumbers{$_l_ChangedIndex})
				[ORDER_ITEMS:25]Job_Stage:35:=PRO_at_Stages{$_l_ChangedIndex}
				[ORDER_ITEMS:25]Description:44:=PRO_at_Descriptions{$_l_ChangedIndex}
				DB_SaveRecord(->[ORDER_ITEMS:25])
				
			End if 
		End for 
		USE NAMED SELECTION:C332("$Current")
		CANCEL:C270
		
	Else 
		OK:=1
		CANCEL:C270
	End if 
	
Else 
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ PROMANAGER.oExit"; $_t_oldMethodName)
