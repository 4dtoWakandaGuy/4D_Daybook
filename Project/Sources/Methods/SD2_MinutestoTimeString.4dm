//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_MinutestoTimeString
	//------------------ Method Notes ------------------
	//This method returns a string in the form N Days Y Hrs P mins from a longint input of minutes
	//------------------ Revision Control ----------------
	//Date Created: 25/02/2010 16:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Days; $_l_Hours; $_l_Time; $_l_TImeInMinutes; $1)
	C_TEXT:C284($_t_DaysName; $_t_HoursName; $_t_MinsName; $_t_oldMethodName; $_t_Output; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_MinutestoTimeString")

$_t_Output:=""
If (Count parameters:C259>=1)
	
	$_l_TImeInMinutes:=$1
	
	Case of 
		: ($_l_TImeInMinutes<60)
			If ($_l_TImeInMinutes>1)
				
				$_t_MinsName:=" Mins"
			Else 
				$_t_MinsName:=" Min"
			End if 
			$_t_Output:=String:C10($_l_TImeInMinutes)+$_t_MinsName
		: ($_l_TImeInMinutes<(60*24))
			$_l_Hours:=0
			$_l_Time:=$_l_TImeInMinutes
			Repeat 
				$_l_Hours:=$_l_Hours+1
				$_l_Time:=$_l_Time-60
			Until ($_l_Time<60)
			If ($_l_Hours>1)
				$_t_HoursName:=" Hrs "
			Else 
				$_t_HoursName:=" Hr "
			End if 
			If ($_l_Time>1)
				
				$_t_MinsName:=" Mins"
			Else 
				$_t_MinsName:=" Min"
			End if 
			If ($_l_Time>0)
				
				$_t_Output:=String:C10($_l_Hours)+$_t_HoursName+String:C10($_l_Time)+$_t_MinsName
				
			Else 
				$_t_Output:=String:C10($_l_Hours)+$_t_HoursName
			End if 
		Else 
			$_l_Days:=0
			$_l_Hours:=0
			$_l_Time:=$_l_TImeInMinutes
			Repeat 
				$_l_Days:=$_l_Days+1
				$_l_Time:=$_l_Time-(60*24)
			Until ($_l_Time<=(60*24))
			If ($_l_Time>=60)
				Repeat 
					$_l_Hours:=$_l_Hours+1
					$_l_Time:=$_l_Time-60
				Until ($_l_Time<60)
			End if 
			If ($_l_Days>1)
				$_t_DaysName:=" Days "
			Else 
				$_t_DaysName:=" Day "
			End if 
			If ($_l_Hours>1)
				$_t_HoursName:=" Hrs "
			Else 
				$_t_HoursName:=" Hr "
			End if 
			If ($_l_Time>1)
				
				$_t_MinsName:=" Mins"
			Else 
				$_t_MinsName:=" Min"
			End if 
			Case of 
				: ($_l_Hours>0)
					If ($_l_Time>0)
						$_t_Output:=String:C10($_l_Days)+$_t_DaysName+String:C10($_l_Hours)+$_t_HoursName+String:C10($_l_Time)+$_t_MinsName
					Else 
						$_t_Output:=String:C10($_l_Days)+$_t_DaysName+String:C10($_l_Hours)+$_t_HoursName
					End if 
				: ($_l_Time>0)
					If ($_l_Hours>0)
						$_t_Output:=String:C10($_l_Days)+$_t_DaysName+String:C10($_l_Hours)+$_t_HoursName+String:C10($_l_Time)+$_t_MinsName
						
					Else 
						$_t_Output:=String:C10($_l_Days)+$_t_DaysName+String:C10($_l_Time)+$_t_MinsName
					End if 
					
			End case 
	End case 
	$0:=$_t_Output
End if 
ERR_MethodTrackerReturn("SD2_MinutestoTimeString"; $_t_oldMethodName)
