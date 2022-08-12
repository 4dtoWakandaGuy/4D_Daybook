//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_SetEaster
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
	C_DATE:C307($_d_AprilDate; $_d_MarchDate; $0)
	C_LONGINT:C283($_l_Factor; $_l_FirstCalculation; $_l_Offset; $_l_SecondCalculation; $_l_Year; $_l_YearDiv4; $_l_YearMod19; $_l_YearMod7; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WS_SetEaster")
If (Count parameters:C259>=1)
	$_l_Year:=$1
	Case of   //Obtain the values for $_l_Offset and $_l_Factor
		: (($_l_Year>=1583) & ($_l_Year<=1699))
			$_l_Offset:=22
			$_l_Factor:=2
		: (($_l_Year>=1700) & ($_l_Year<=1799))
			$_l_Offset:=23
			$_l_Factor:=3
		: (($_l_Year>=1800) & ($_l_Year<=1899))
			$_l_Offset:=23
			$_l_Factor:=4
		: (($_l_Year>=1900) & ($_l_Year<=2099))
			$_l_Offset:=24
			$_l_Factor:=5
		: (($_l_Year>=2100) & ($_l_Year<=2199))
			$_l_Offset:=24
			$_l_Factor:=6
		: (($_l_Year>=2200) & ($_l_Year<=2299))
			$_l_Offset:=25
			$_l_Factor:=0
	End case 
	$_l_YearMod19:=$_l_Year%19  //Modulo of the year divided by 19
	$_l_YearDiv4:=$_l_Year%4  //Modulo of the year divided by 4
	$_l_YearMod7:=$_l_Year%7  //Modulo of the year divided by 7
	$_l_FirstCalculation:=((19*$_l_YearMod19)+$_l_Offset)%30
	$_l_SecondCalculation:=((2*$_l_YearDiv4)+(4*$_l_YearMod7)+(6*$_l_FirstCalculation)+$_l_Factor)%7
	
	$_d_MarchDate:=Date:C102("3/"+String:C10((22+$_l_FirstCalculation+$_l_SecondCalculation); "00/")+String:C10($_l_Year))
	//Easter is either the (22+$_l_FirstCalculation+$_l_SecondCalculation) of March or the ($_l_FirstCalculation+$_l_SecondCalculation-9) of April
	If (Day of:C23($_d_MarchDate)<=31)  //If the day’s number is greater than 31,
		$0:=$_d_MarchDate  //Easter is in March
	Else   //Otherwise Easter is in April
		$_d_AprilDate:=Date:C102("4/"+String:C10(($_l_FirstCalculation+$_l_SecondCalculation-9); "00/")+String:C10($_l_Year))
		Case of   //Replace April 26 by April 19
			: ($_d_AprilDate=Date:C102("4/26/"+String:C10($_l_Year)))
				$_d_AprilDate:=Date:C102("4/19/"+String:C10($_l_Year))
			: (($_d_AprilDate=Date:C102("4/25/"+String:C10($_l_Year))) & ($_l_FirstCalculation=28) & ($_l_SecondCalculation=6) & ($_l_YearMod19>10))
				//Replace April 25 by April 18, if $_l_FirstCalculation=28 and $_l_SecondCalculation=6 and $_l_YearMod19>10
				$_d_AprilDate:=Date:C102("4/18/"+String:C10($_l_Year))
		End case 
		$0:=$_d_AprilDate
	End if 
Else 
	$0:=!00-00-00!
End if 
ERR_MethodTrackerReturn("WS_SetEaster"; $_t_oldMethodName)