//%attributes = {}
If (False:C215)
	//Project Method Name:      EXP_AddXMLelement
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
	C_BOOLEAN:C305($_bo_CloseElement; $4)
	C_TEXT:C284($_t_oldMethodName; $_t_Value; $2; $3)
	C_TIME:C306($1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EXP_AddXMLelement")
If (Count parameters:C259>=3)
	If (Count parameters:C259>=4)
		$_bo_CloseElement:=$4
	Else 
		$_bo_CloseElement:=True:C214
	End if 
	If ($1#?00:00:00?)
		If ($3#"")
			$_t_Value:=EXP_XMLCOMPLIANCE($3)
			
		Else 
			$_t_Value:=""
		End if 
		If ($2#"")
			SAX OPEN XML ELEMENT:C853($1; $2)
			If ($_t_Value#"")
				SAX ADD XML ELEMENT VALUE:C855($1; $_t_Value)
			End if 
		End if 
		If ($_bo_CloseElement)
			SAX CLOSE XML ELEMENT:C854($1)
			
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("EXP_AddXMLelement"; $_t_oldMethodName)