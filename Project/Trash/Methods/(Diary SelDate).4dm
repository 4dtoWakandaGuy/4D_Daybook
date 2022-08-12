//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_SelDate
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
	C_BOOLEAN:C305($_bo_WithWildCard; $2)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_Output; $0)
	C_LONGINT:C283($_l_CurrentDayNumber; $_l_InputNumber; $_l_Offset)
	C_TEXT:C284($_t_Input; $_t_LastWord; $_t_oldMethodName; $_t_WildCard; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_SelDate")
//Diary_SelDate
If ($1#"")
	$_t_Input:=$1
	$_d_output:=!00-00-00!
	If (Count parameters:C259>=2)
		$_bo_WithWildCard:=$2
	End if 
	If ((Length:C16($_t_Input)<3) & (Character code:C91(Substring:C12($_t_Input; 1; 1))<58))
		$_l_InputNumber:=Num:C11($_t_Input)
		If (($_l_InputNumber#0) & ($_l_InputNumber<32))
			$_d_Output:=Date_FromStrs($_t_Input; String:C10(Month of:C24(<>DB_d_CurrentDate)); String:C10(Year of:C25(<>DB_d_CurrentDate)))
		Else 
			$_d_Output:=!00-00-00!
		End if 
	Else 
		$_d_Output:=Date:C102($_t_Input)
		$_l_InputNumber:=Num:C11($_t_Input)
	End if 
	
	If ($_bo_WithWildCard)
		$_t_WildCard:="@"
	Else 
		$_t_WildCard:=""
	End if 
	
	If (($_d_Output=!00-00-00!) & ($_l_InputNumber=0))
		Case of 
			: (($_t_Input="Today") | ($_t_Input=("Tod"+$_t_WildCard)))
				$_d_Output:=<>DB_d_CurrentDate
			: (($_t_Input="Yesterday") | ($_t_Input=("Yes"+$_t_WildCard)))
				$_d_Output:=<>DB_d_CurrentDate-1
			: (($_t_Input="Tomorrow") | ($_t_Input=("Tom"+$_t_WildCard)))
				$_d_Output:=<>DB_d_CurrentDate+1
			Else 
				Case of 
					: ($_t_Input="Next@")
						$_l_Offset:=7
					: ($_t_Input="Last@")
						$_l_Offset:=-7
					Else 
						$_l_Offset:=0
				End case 
				$_t_LastWord:=LastWord2($_t_Input)
				If (($_t_LastWord="Week") | ($_t_LastWord="Wk"))
					$_l_Offset:=14
					$_t_LastWord:=FirstWord($_t_Input)
				End if 
				$_l_CurrentDayNumber:=Day number:C114(<>DB_d_CurrentDate)
				Case of 
					: (($_t_LastWord=("Sun"+$_t_WildCard)) | ($_t_LastWord="Sunday"))
						$_d_Output:=<>DB_d_CurrentDate-$_l_CurrentDayNumber+$_l_Offset+1
					: (($_t_LastWord=("Mon"+$_t_WildCard)) | ($_t_LastWord="Monday"))
						$_d_Output:=<>DB_d_CurrentDate-$_l_CurrentDayNumber+$_l_Offset+2
					: (($_t_LastWord=("Tue"+$_t_WildCard)) | ($_t_LastWord="Tuesday"))
						$_d_Output:=<>DB_d_CurrentDate-$_l_CurrentDayNumber+$_l_Offset+3
					: (($_t_LastWord=("Wed"+$_t_WildCard)) | ($_t_LastWord="Wednesday"))
						$_d_Output:=<>DB_d_CurrentDate-$_l_CurrentDayNumber+$_l_Offset+4
					: (($_t_LastWord=("Thu"+$_t_WildCard)) | ($_t_LastWord="Thursday"))
						$_d_Output:=<>DB_d_CurrentDate-$_l_CurrentDayNumber+$_l_Offset+5
					: (($_t_LastWord=("Fri"+$_t_WildCard)) | ($_t_LastWord="Friday"))
						$_d_Output:=<>DB_d_CurrentDate-$_l_CurrentDayNumber+$_l_Offset+6
					: (($_t_LastWord=("Sat"+$_t_WildCard)) | ($_t_LastWord="Saturday"))
						$_d_Output:=<>DB_d_CurrentDate-$_l_CurrentDayNumber+$_l_Offset+7
				End case 
		End case 
	End if 
	$0:=$_d_output
	
End if 
ERR_MethodTrackerReturn("Diary_SelDate"; $_t_oldMethodName)