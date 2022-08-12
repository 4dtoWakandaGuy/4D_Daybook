//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_WorkingDays
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
	//ARRAY DATE(BAT_ad_BankHolidays;0)
	C_BOOLEAN:C305($3; $4)
	C_DATE:C307($_d_DateCheck; $_d_DateCheckOriginal; $0; $1)
	C_LONGINT:C283($_l_DayCount; $_l_DaysRemaining; $_l_YearStart; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_WorkingDays")
//this method will return a date that is a working day
//$1=Start Date for calc
//$2=Days wanted
//$3=Saturday is working Day
//$4=Sunday is working Day
//BANK HOLIDAYS
//put in bank holidays for the next year
//1st jan
//Easter
//1st Monday May
//Last Monday in May
//last monday in august
$_d_DateCheck:=$1
If ($_d_DateCheck=!00-00-00!)
	$_d_DateCheckOriginal:=Current date:C33(*)
Else 
	$_d_DateCheckOriginal:=$_d_DateCheck
End if 

SD_SetBankHols($1)
$_l_DayCount:=0
$_l_DaysRemaining:=$2+1
$_l_YearStart:=Year of:C25($1)
//this is fine for BAT because we are talking small numbers of days -but
//in Daybook this will
Repeat 
	//$1=Start Date for calc
	//$2=Days wanted
	//$3=Saturday is working Day
	//$4=Sunday is working Day
	$_d_DateCheck:=$_d_DateCheckOriginal+$_l_DayCount
	Case of 
		: (Day number:C114($_d_DateCheck)=7)  //Sat
			If ($3)
				$_l_DaysRemaining:=$_l_DaysRemaining-1
			End if 
		: (Day number:C114($_d_DateCheck)=1)  //Sun
			If ($4)
				$_l_DaysRemaining:=$_l_DaysRemaining-1
			End if 
		: (Find in array:C230(BAT_ad_BankHolidays; $_d_DateCheck)>0)
			
		Else 
			$_l_DaysRemaining:=$_l_DaysRemaining-1
	End case 
	$_l_DayCount:=$_l_DayCount+1
	If (Year of:C25($_d_DateCheck+1)>$_l_YearStart)
		//moved to next year!-=Recalc Bank hols
		SD_SetBankHols($_d_DateCheck+1)
		$_l_YearStart:=$_l_YearStart+1
	End if 
Until ($_l_DaysRemaining=0)
$0:=$_d_DateCheck
ERR_MethodTrackerReturn("SD_WorkingDays"; $_t_oldMethodName)
