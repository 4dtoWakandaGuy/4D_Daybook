//%attributes = {}
If (False:C215)
	//Project Method Name:      VER_String
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_DevelopmentStage; $5)
	C_TEXT:C284($_t_oldMethodName; $_t_Version1; $_t_Version2; $_t_Version3; $_t_Version4; $0; $1; $2; $3; $4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("VER_String")
If (Count parameters:C259>=5)
	$_t_Version1:=$1
	$_t_Version2:=$2
	$_t_Version3:=$3
	$_t_Version4:=$4
	
	$_l_DevelopmentStage:=$5
	
	Case of 
		: ($_l_DevelopmentStage=1)
			$0:="d"+$_t_Version1+"."+$_t_Version2+"."+$_t_Version3+"/"+$_t_Version4
		: ($_l_DevelopmentStage=2)
			$0:="a"+$_t_Version1+"."+$_t_Version2+"."+$_t_Version3+"/"+$_t_Version4
		: ($_l_DevelopmentStage=3)
			$0:="b"+$_t_Version1+"."+$_t_Version2+"."+$_t_Version3+"/"+$_t_Version4
		Else 
			$0:="v"+$_t_Version1+"."+$_t_Version2+"."+$_t_Version3+"/"+$_t_Version4
	End case 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("VER_String"; $_t_oldMethodName)
