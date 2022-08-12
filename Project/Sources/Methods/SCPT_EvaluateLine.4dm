//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_EvaluateLine
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/11/2009 07:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SCPT_bo_LookUpCommandID; SCPT_bo_LookUpMethodNames; SCPT_bo_TestMethodCalls)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Index)
	C_TEXT:C284($_t_LineText; $_t_oldMethodName; $_t_ReturnParameter; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_EvaluateLine")

//This method evaluates the statement passed to it.
//Pass the following parameters
//1) Text, the text to evaluate
//2) The evaluation level
//The evaluation level works like this
//say we have the following line
//mMsg:=mMsg+"Something+SomeCommand(parameter;parameter))"
//the first evaluation(level 1) will see the := and then determine there is a := and set the row passed in $3 as having an assign command
//the second evaluation(level 0) will evaluate the bit before the := e.g mMsg this will set the return value of the row to msg(the name of the var to set-this could be a field)
//The 3rd evaluation (level2 )will evaluate the 'parameters' of the assignment this will see the ( and then the +(this could be minus or other operator)
//this will assess the bits before the+ into the next evaluation
//if there is a "(" then anything immediatly precedeeding it that is not a + - / * := = is either a 4D command which we can look up or is a method call
SCPT_bo_TestMethodCalls:=False:C215
SCPT_bo_LookUpMethodNames:=False:C215
SCPT_bo_LookUpCommandID:=False:C215
//In statement whether an assign or not each 'part' of the statement is either a variable
If (Count parameters:C259>=3)
	$_t_LineText:=$1
	//UNICODE TEST
	$_l_CharacterPosition:=Position:C15(":="; $_t_LineText; *)
	If ($_l_CharacterPosition>0)
		$_t_ReturnParameter:=Substring:C12($_t_LineText; 1; $_l_CharacterPosition-1)
		//SCPT_EvaluateLine ($_t_ReturnParameter;0;$3)
		$_t_LineText:=Substring:C12($_t_LineText; $_l_CharacterPosition+2; Length:C16($_t_LineText))
	End if 
	For ($_l_Index; 1; Length:C16($_t_LineText))
		Case of 
			: ($_t_LineText[[$_l_Index]]="")
			: ($_t_LineText[[$_l_Index]]="+")  // this could be adding numbers together or string
			: ($_t_LineText[[$_l_Index]]="-")  //this can only be dealing with numbers or dates
			: ($_t_LineText[[$_l_Index]]="/")  //divide by
			: ($_t_LineText[[$_l_Index]]="*")  //multiply by
		End case 
	End for 
End if 
ERR_MethodTrackerReturn("SCPT_EvaluateLine"; $_t_oldMethodName)
