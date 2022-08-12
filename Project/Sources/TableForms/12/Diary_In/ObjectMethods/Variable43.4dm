If (False:C215)
	//object Name: [DIARY]Diary_In.Variable43
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_In.Variable43"; Form event code:C388)
If ((Not:C34(Locked:C147([DIARY:12]))) & (Not:C34(Read only state:C362([DIARY:12]))))
	If ([DIARY:12]Priority:17>"1")
		[DIARY:12]Priority:17:=Char:C90(Character code:C91([DIARY:12]Priority:17)-1)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_In.Variable43"; $_t_oldMethodName)
