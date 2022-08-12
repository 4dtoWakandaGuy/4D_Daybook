//%attributes = {}

If (False:C215)
	//Project Method Name:      UTIL_trimCollection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  19/05/2021
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_OBJECT:C1216($_obj_List; $1)
	C_TEXT:C284($_t_Chars; $_t_Position; $2; $3)
End if 
//Code Starts Here
C_OBJECT:C1216($_obj_List)

If (Count parameters:C259>=1)
	$_obj_List:=$1
	If (Count parameters:C259>=3)
		$_t_Position:=$2
		$_t_Chars:=$3
	Else 
		$_t_Position:="B"
		$_t_Chars:=" "
	End if 
	$_obj_List.value:=Replace string:C233($_obj_List.value; "  "; " ")
	//$_obj_List.result:=G_Trim($_obj_List.value;$_t_Position;$_t_Chars)
	$_obj_List.result:=UTIL_TrimSpaces(New object:C1471("text"; $_obj_List.value; "where"; New collection:C1472("Start"; "End"); "chars"; New collection:C1472($_t_Chars)))
	$0:=$_obj_List.result
	
	
	
End if 
