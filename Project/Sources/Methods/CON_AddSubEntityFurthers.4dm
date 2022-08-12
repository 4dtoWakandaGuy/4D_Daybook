//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_AddSubEntityFurthers
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CON_abo_FurtherMod;0)
	//ARRAY TEXT(CON_at_FurtherCodes;0)
	C_LONGINT:C283($_l_FurtherCodeRow; bCON_l_FurthDelete; bCON_l_Furthmodify; CON_l_CurrentFurtherStatus)
	C_TEXT:C284($_t_oldMethodName; CON_t_CurContactCode; CON_t_CurFurtherCode)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CON_AddSubEntityFurthers")

//NG Feb 2004
//The method is only applicable within the form [CONTRACTS]Contract_in
//It is the script of the button bCON_l_Furthmodify which adds a newFurther cocode(or set a highlighted one to edit)
//it is in a method so the call can be via an outside call
$_t_oldMethodName:=ERR_MethodTracker("CON_AddSubEntityFurthers"; Form event code:C388)
Case of 
	: (CON_l_CurrentFurtherStatus=0)
		OBJECT SET VISIBLE:C603(bCON_l_FurthDelete; True:C214)
		OBJECT SET VISIBLE:C603(CON_t_CurFurtherCode; True:C214)
		
		CON_t_CurFurtherCode:=""
		CON_at_FurtherCodes{0}:=""
		CON_at_FurtherCodes:=0
		OBJECT SET TITLE:C194(bCON_l_FurthDelete; "Clear")
		OBJECT SET TITLE:C194(bCON_l_Furthmodify; "Save")
		CON_l_CurrentFurtherStatus:=2
	: (CON_l_CurrentFurtherStatus=1)
		//item is selected not in edit mode
		//(Button text will say 'Edit')
		OBJECT SET VISIBLE:C603(bCON_l_FurthDelete; True:C214)
		CON_l_CurrentFurtherStatus:=2
		OBJECT SET TITLE:C194(bCON_l_Furthmodify; "Save")
		OBJECT SET TITLE:C194(bCON_l_FurthDelete; "Delete")
	: (CON_l_CurrentFurtherStatus=2)
		//editing (button text says save)
		
		If (CON_at_FurtherCodes{0}#CON_t_CurFurtherCode)
			//item is modified
			
			Case of 
				: (CON_at_FurtherCodes{0}#"")
					//editing an existing entry
					CONFIRM:C162("Change "+CON_at_FurtherCodes{0}+" to "+CON_t_CurFurtherCode)
					If (OK=1)
						$_l_FurtherCodeRow:=Find in array:C230(CON_at_FurtherCodes; CON_at_FurtherCodes{0})
						If ($_l_FurtherCodeRow>0)
							CON_at_FurtherCodes{$_l_FurtherCodeRow}:=CON_t_CurContactCode
							CON_abo_FurtherMod{$_l_FurtherCodeRow}:=True:C214
						Else 
							//error
						End if 
						
					End if 
				: (CON_at_FurtherCodes{0}="")
					//entering a new one
					CONFIRM:C162("Save additional Further Analysis "+CON_t_CurFurtherCode+"?")
					If (OK=1)
						INSERT IN ARRAY:C227(CON_at_FurtherCodes; Size of array:C274(CON_at_FurtherCodes)+1; 1)  //to hold the current subrecords
						INSERT IN ARRAY:C227(CON_abo_FurtherMod; Size of array:C274(CON_abo_FurtherMod)+1; 1)  //to track modified
						CON_at_FurtherCodes{Size of array:C274(CON_at_FurtherCodes)}:=CON_t_CurFurtherCode
						CON_abo_FurtherMod{Size of array:C274(CON_abo_FurtherMod)}:=True:C214
						
						
						
					End if 
					
			End case 
			
			
		End if 
		OBJECT SET TITLE:C194(bCON_l_FurthDelete; "Clear")
		OBJECT SET VISIBLE:C603(bCON_l_FurthDelete; False:C215)
		OBJECT SET TITLE:C194(bCON_l_Furthmodify; "Add")
		CON_l_CurrentFurtherStatus:=0
		
		OBJECT SET VISIBLE:C603(CON_t_CurFurtherCode; False:C215)
		
		CON_t_CurFurtherCode:=""
		
		
		CON_at_FurtherCodes{0}:=""
		CON_at_FurtherCodes:=0
		
End case 
ERR_MethodTrackerReturn("CON_AddSubEntityFurthers"; $_t_oldMethodName)