If (False:C215)
	//object Name: [USER]User_In.oMap
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
	//ARRAY BOOLEAN(e_LB_FieldMap;0)
	//ARRAY TEXT(EW_at_DBFieldNames;0)
	C_LONGINT:C283($_l_FormEvent)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oMap"; Form event code:C388)
// eALFieldList

//$_l_FormEvent:=ALProEvt
$_l_FormEvent:=Form event code:C388

Case of 
		//: ($_l_FormEvent=-5)  ` a row was dragged
	: ($_l_FormEvent=On Drop:K2:12)
		Case of 
			: (Size of array:C274(EW_at_DBFieldNames)=0)
				//        ALERT("Please select a Daybook table first!")
				Gen_Alert("Please select a Daybook table first!")
			Else 
				EW_DropEvent(->e_LB_FieldMap)
		End case 
		//    AL_UpdateArrays (eALFieldMap;-1)
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oMap"; $_t_oldMethodName)
