//%attributes = {}
If (False:C215)
	//Project Method Name:      MACRO_KEY
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
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts)
	C_LONGINT:C283($_l_Parameter1; $_l_Parameter2; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_Parameter1; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MACRO_KEY")


$_t_Parameter1:=$1
$_l_Parameter2:=$2  //NUM
//$p2:=$_l_Parameter2
If ($_t_Parameter1#"")
	If (String:C10(Num:C11($_t_Parameter1))="0")  //string starts with ""
		If (Length:C16($_t_Parameter1)=1)
			If (($_l_Parameter2/256)=Abs:C99($_l_Parameter2/256))
				If (<>SCPT_bo_NoAutoScripts=False:C215)
					If ($_t_Parameter1=" ")
						PLAY:C290("Key Space")
					Else 
						PLAY:C290("Key 1")
					End if 
				End if 
				Gen_PostKey(0; Character code:C91($_t_Parameter1); $_l_Parameter2)
			End if 
		Else 
			If (<>SCPT_bo_NoAutoScripts=False:C215)
				Play_Words($_t_Parameter1)
			End if 
			$_l_Parameter2:=1
			While ($_l_Parameter2<=Length:C16($_t_Parameter1))
				Gen_PostKey(0; Character code:C91(Substring:C12($_t_Parameter1; $_l_Parameter2; 1)); 0)
				$_l_Parameter2:=$_l_Parameter2+1
			End while 
		End if 
	Else 
		$_l_Parameter1:=Num:C11($_t_Parameter1)
		If (($_l_Parameter1>0) & ($_l_Parameter1<256) & (($_l_Parameter2=0) | (($_l_Parameter2/256)=Abs:C99($_l_Parameter2/256))))
			
			If (<>SCPT_bo_NoAutoScripts=False:C215)
				If ($_l_Parameter1=32)
					PLAY:C290("Key Space")
				Else 
					PLAY:C290("Key 1")
				End if 
			End if 
			Gen_PostKey(0; $_l_Parameter1; $_l_Parameter2)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("MACRO_KEY"; $_t_oldMethodName)
