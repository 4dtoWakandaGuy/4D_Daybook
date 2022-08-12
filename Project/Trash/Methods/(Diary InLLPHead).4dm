//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_InLLPHead
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(EMAIL_bo_MailListBuilt)
	C_TEXT:C284($_t_oldMethodName; $Head; vContName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vLetterDate)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InLLPHead")

//If (◊Write#"SW") superWrite out 24/04/02 pb
Case of 
	: (DB_t_CurrentFormUsage="Q")
		If (([DIARY:12]Document_Heading:32="") | ([DIARY:12]Document_Heading:32="Quote @"))
			$Head:="Quote "+vLetterDate+" to "+vContName+", "+[COMPANIES:2]Company_Name:2
			If (Length:C16($Head)>51)
				$Head:="Quote "+vLetterDate+" to "+vContName
			End if 
			[DIARY:12]Document_Heading:32:=$Head
		End if 
		Address_Details
		Address_Contact
	: (DB_t_CurrentFormUsage="E")
		If (([DIARY:12]Document_Heading:32="") | ([DIARY:12]Document_Heading:32="Email @"))
			$Head:="Email "+vLetterDate+" to "+vContName+", "+[COMPANIES:2]Company_Name:2
			If (Length:C16($Head)>51)
				$Head:="Email "+vLetterDate+" to "+vContName
			End if 
			[DIARY:12]Document_Heading:32:=$Head
		End if 
		RELATE MANY:C262([DIARY:12]Diary_Code:3)
	Else 
		If (([DIARY:12]Document_Heading:32="") | ([DIARY:12]Document_Heading:32="Letter @"))
			$Head:="Letter "+vLetterDate+" to "+vContName+", "+[COMPANIES:2]Company_Name:2
			If (Length:C16($Head)>51)
				$Head:="Letter "+vLetterDate+" to "+vContName
			End if 
			[DIARY:12]Document_Heading:32:=$Head
		End if 
End case 
//End if
ERR_MethodTrackerReturn("Diary_InLLPHead"; $_t_oldMethodName)