//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetDateandTimeFromString
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
	C_DATE:C307($_d_FormatTest)
	C_LONGINT:C283(<>SD2_l_DFomat; $_l_CharacterPosition; $_l_Day; $_l_FirstChar; $_l_Month; $_l_Year; $_l_Year2)
	C_POINTER:C301($_ptr_Date; $_ptr_Time; $2; $3)
	C_TEXT:C284($_t_DateandTime; $_t_FormatTestSTR; $_t_oldMethodName; $1)
	C_TIME:C306($_ti_Time)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetDateandTimeFromString")

If (Count parameters:C259>=3)
	$_t_DateandTime:=$1
	$_ptr_Date:=$2
	$_ptr_Time:=$3
	
	$_ptr_Date->:=Current date:C33
	$_ptr_Time->:=Current time:C178
	
	$_l_Day:=0
	$_l_Month:=0
	$_l_Year:=0
	
	$_l_CharacterPosition:=Position:C15(", "; $_t_DateandTime)  // Find the comma after the day of the week.
	If ($_l_CharacterPosition>0)  // Most email has it, but not all, so continue even if it isn't found.
		$_t_DateandTime:=Substring:C12($_t_DateandTime; ($_l_CharacterPosition+2))  // Get rid of the day of the week, comma, and space.
	End if 
	
	If (Substring:C12($_t_DateandTime; 1; 1)=" ")  // Some systems stick an extra space in here.
		$_t_DateandTime:=Substring:C12($_t_DateandTime; 2)
	End if 
	
	$_l_CharacterPosition:=Position:C15(" "; $_t_DateandTime)  // Find the next space.
	If ($_l_CharacterPosition>0)
		$_l_Day:=Num:C11(Substring:C12($_t_DateandTime; 1; ($_l_CharacterPosition-1)))
		
		$_t_DateandTime:=Substring:C12($_t_DateandTime; ($_l_CharacterPosition+1))  // Get rid of the date and space.
		$_l_Month:=SD2_GetMonthNumberFromName($_t_DateandTime)  // Get the month number.
		
		$_l_CharacterPosition:=Position:C15(" "; $_t_DateandTime)  // Find the next space.
		If ($_l_CharacterPosition>0)
			$_t_DateandTime:=Substring:C12($_t_DateandTime; ($_l_CharacterPosition+1))  // Get rid of the date and space.
			
			$_l_CharacterPosition:=Position:C15(" "; $_t_DateandTime)  // Find the next space.
			If ($_l_CharacterPosition>0)
				$_l_Year:=Num:C11(Substring:C12($_t_DateandTime; 1; ($_l_CharacterPosition-1)))
				
				$_t_DateandTime:=Substring:C12($_t_DateandTime; ($_l_CharacterPosition+1))  // Get rid of the year and space.
				
				$_l_CharacterPosition:=Position:C15(" "; $_t_DateandTime)  // Find the next space.
				If ($_l_CharacterPosition>0)
					$_t_DateandTime:=Substring:C12($_t_DateandTime; 1; ($_l_CharacterPosition-1))
					$_ti_Time:=Time:C179($_t_DateandTime)
					If ($_ti_Time#?00:00:00?)
						If ($_ti_Time>?24:00:00?)
							//TRACE
						End if 
						$_ptr_Time->:=Time:C179($_t_DateandTime)
					End if 
				End if 
			End if 
		End if 
	End if 
	If (<>SD2_l_DFomat=0)  //Only set this once!!!
		$_l_Year2:=Year of:C25(Current date:C33(*))
		<>SD2_l_DFomat:=2
		$_d_FormatTest:=Date:C102("01/01/"+String:C10($_l_Year2))
		$_d_FormatTest:=$_d_FormatTest-1
		$_t_FormatTestSTR:=String:C10($_d_FormatTest)
		$_l_CharacterPosition:=Position:C15("/"; $_t_FormatTestSTR)
		If ($_l_CharacterPosition>0)  // It should Be
			$_l_FirstChar:=Num:C11(Substring:C12($_t_FormatTestSTR; 1; $_l_CharacterPosition-1))
			If ($_l_FirstChar=31)
				<>SD2_l_DFomat:=1
			End if 
		End if 
	End if 
	Case of 
		: (($_l_Day=0) | ($_l_Month=0) | ($_l_Year=0))
			//TRACE// We didn't get a valid date. Use the default we set above.
		: (<>SD2_l_DFomat=1)
			$_ptr_Date->:=Date:C102(String:C10($_l_Month)+"/"+String:C10($_l_Day)+"/"+String:C10($_l_Year))
		: (<>SD2_l_DFomat=2)
			$_ptr_Date->:=Date:C102(String:C10($_l_Day)+"/"+String:C10($_l_Month)+"/"+String:C10($_l_Year))
	End case 
End if 
ERR_MethodTrackerReturn("SD2_GetDateandTimeFromString"; $_t_oldMethodName)
