If (False:C215)
	//object Name: [USER]User_In.oBKF
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER]User_In.oBKF"; Form event code:C388)


//$_t_oldMethodName:=ERR_MethodTracker ("OBJ [USER].User_In.oBKF";Form event)
// eALFieldList

//$_l_FormEvent:=ALProEvt
//$_l_FormEvent:=Form event

//Case of
//: ($_l_FormEvent=-5)  ` a row was dragged
//: ($_l_FormEvent=On Drop )
//Case of
//: (Size of array(EW_at_DBFieldNames)=0)
//        ALERT("Please select a Daybook table first!")
//Gen_Alert ("Please select a Daybook table first!")
//Else
//EW_DropEvent (Self->)
//End case
//    AL_UpdateArrays (eALFieldMap;-1)
//End case
//ERR_MethodTrackerReturn ("OBJ [USER].User_In.oBKF";$_t_oldMethodName)
// THIS HAS ALL BEEN MOVED TO THE OTHER AREA FOR "ON DROP"
ERR_MethodTrackerReturn("OBJ [USER]User_In.oBKF"; $_t_oldMethodName)