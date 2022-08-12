//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_LoadDiaryLocations
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Bit)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; DB_t_Methodname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadDiaryLocations")
DB_t_Methodname:=Current method name:C684
//This method loads the names of and IDs of Diary Locations
//This is so it is quick an easy to modify what they are called or add additional locations on without changing more than this piece of code
If (Count parameters:C259>=2)
	If (GenValidatePointer($1)) & (GenValidatePointer($2))
		ARRAY LONGINT:C221($1->; 0)
		ARRAY TEXT:C222($2->; 0)
		ARRAY LONGINT:C221($1->; 4)
		ARRAY TEXT:C222($2->; 4)
		$_l_Bit:=0
		GEN_setBit(->$_l_Bit; 1)
		$1->{1}:=$_l_Bit
		$2->{1}:="Schedule"
		//`
		$_l_Bit:=0
		GEN_setBit(->$_l_Bit; 2)
		$1->{2}:=$_l_Bit
		$2->{2}:="Workflow"
		//`
		$_l_Bit:=0
		GEN_setBit(->$_l_Bit; 3)
		$1->{3}:=3
		$2->{3}:="Diary Tabs Only"
		
		$_l_Bit:=0
		GEN_setBit(->$_l_Bit; 4)
		$1->{4}:=$_l_Bit
		$2->{4}:="Timed Function"
	End if 
End if 
//Next one is 16,then 32 64 128 256 etc
//`
ERR_MethodTrackerReturn("SD2_LoadDiaryLocations"; $_t_oldMethodName)