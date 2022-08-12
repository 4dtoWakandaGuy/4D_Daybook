//%attributes = {}
If (False:C215)
	//Project Method Name:      Con_DelSubEntityFurthers
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
	//ARRAY TEXT(CON_at_DelFurtherCode;0)
	//ARRAY TEXT(CON_at_FurtherCodes;0)
	C_LONGINT:C283($_l_FurtherCodeRow; bCON_l_FurthDelete; bCON_l_Furthmodify; CON_l_CurrentFurtherStatus)
	C_TEXT:C284($_t_oldMethodName; CON_t_CurFurtherCode)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Con_DelSubEntityFurthers")

//NG Feb 2004
//The method is only applicable within the form [contracts]Contract_in
//It is the script of the button bCON_l_FurthDelete which adds an Further(or clears an entry)
//it is in a method so the call can be via an outside call
$_t_oldMethodName:=ERR_MethodTracker("Con_DelSubEntityFurthers"; Form event code:C388)
Case of 
		
	: (CON_l_CurrentFurtherStatus=0)
		//this button is not visible in this state
		// i am just putting it here for completness
	: (CON_l_CurrentFurtherStatus=1)
		//Item selected not edit
		//just clear back to status 0
		OBJECT SET TITLE:C194(bCON_l_FurthDelete; "Clear")
		OBJECT SET VISIBLE:C603(bCON_l_FurthDelete; False:C215)
		OBJECT SET TITLE:C194(bCON_l_Furthmodify; "Add")
		CON_l_CurrentFurtherStatus:=0
		OBJECT SET VISIBLE:C603(CON_t_CurFurtherCode; False:C215)
		CON_t_CurFurtherCode:=""
		
		CON_at_FurtherCodes{0}:=""
		CON_at_FurtherCodes:=0
	: (CON_l_CurrentFurtherStatus=2)
		//editing record
		//if existing ask user about clearing
		//else just clear
		//both go to status 0
		If (CON_at_FurtherCodes{0}#"")
			CONFIRM:C162("Are you sure you wish to remove this Further Code?")
			If (OK=1)
				
				$_l_FurtherCodeRow:=Find in array:C230(CON_at_FurtherCodes; CON_at_FurtherCodes{0})
				If ($_l_FurtherCodeRow>0)
					APPEND TO ARRAY:C911(CON_at_DelFurtherCode; CON_at_DelFurtherCode{$_l_FurtherCodeRow})
					//INSERT ELEMENT(CON_at_DelFurtherCode;Size of array(CON_at_DelFurtherCode)+1;1)
					//CON_at_DelFurtherCode{Size of array(CON_at_DelFurtherCode)}:=CON_t_CurFurtherCode
					DELETE FROM ARRAY:C228(CON_at_FurtherCodes; $_l_FurtherCodeRow; 1)
					DELETE FROM ARRAY:C228(CON_abo_FurtherMod; $_l_FurtherCodeRow; 1)
					
				Else 
					//error
				End if 
				
			End if 
			
		Else 
			//do nothing just clear
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
ERR_MethodTrackerReturn("Con_DelSubEntityFurthers"; $_t_oldMethodName)