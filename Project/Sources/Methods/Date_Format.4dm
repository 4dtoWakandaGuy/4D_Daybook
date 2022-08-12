//%attributes = {}
If (False:C215)
	//Project Method Name:      Date_Format
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $_d_Date1; $_d_Date2; $1)
	C_LONGINT:C283($_l_Change; $_l_DatePart1; $_l_DatePart2; $_l_DatePart3; $_l_Day; $_l_Month; $_l_Year; $_l_YearShort; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Date_Format")

$0:=0
$_d_Date:=$1
$_l_Day:=Day of:C23($_d_Date)
$_l_Month:=Month of:C24($_d_Date)
$_l_Year:=Year of:C25($_d_Date)
$_l_YearShort:=Num:C11(Substring:C12(String:C10($_l_Year); 3; 2))

If ($_l_Day>12)
	$_l_DatePart1:=Str_DatePos1($_d_Date)
	$_l_DatePart2:=Str_DatePos2($_d_Date)
	$_l_DatePart3:=Str_DatePos3($_d_Date)
	Case of 
		: (($_l_Day=$_l_DatePart1) & ($_l_Month=$_l_DatePart2) & ($_l_Year=$_l_DatePart3))
			$0:=1
		: (($_l_Month=$_l_DatePart1) & ($_l_Day=$_l_DatePart2) & ($_l_Year=$_l_DatePart3))
			$0:=2
		: (($_l_Year=$_l_DatePart1) & ($_l_Month=$_l_DatePart2) & ($_l_Day=$_l_DatePart3))
			$0:=3
		: (($_l_Year=$_l_DatePart1) & ($_l_Day=$_l_DatePart2) & ($_l_Month=$_l_DatePart3))
			$0:=4
		: (($_l_Day=$_l_DatePart1) & ($_l_Month=$_l_DatePart2) & ($_l_YearShort=$_l_DatePart3))
			$0:=1
		: (($_l_Month=$_l_DatePart1) & ($_l_Day=$_l_DatePart2) & ($_l_YearShort=$_l_DatePart3))
			$0:=2
		: (($_l_YearShort=$_l_DatePart1) & ($_l_Month=$_l_DatePart2) & ($_l_Day=$_l_DatePart3))
			$0:=3
		: (($_l_YearShort=$_l_DatePart1) & ($_l_Day=$_l_DatePart2) & ($_l_Month=$_l_DatePart3))
			$0:=4
	End case 
Else 
	$_l_Change:=12
	$_d_Date1:=Date:C102(String:C10($_l_Day+$_l_Change)+"/"+String:C10($_l_Month)+"/"+String:C10($_l_Year))
	$_d_Date2:=$_d_Date+$_l_Change
	If ($_d_Date1=$_d_Date2)
		$0:=1
	Else 
		$_d_Date1:=Date:C102(String:C10($_l_Month)+"/"+String:C10($_l_Day+$_l_Change)+"/"+String:C10($_l_Year))
		If ($_d_Date1=$_d_Date2)
			$0:=2
		Else 
			$_d_Date1:=Date:C102(String:C10($_l_Year)+"/"+String:C10($_l_Month)+"/"+String:C10($_l_Day+$_l_Change))
			If ($_d_Date1=$_d_Date2)
				$0:=3
			Else 
				$_d_Date1:=Date:C102(String:C10($_l_Year)+"/"+String:C10($_l_Day+$_l_Change)+"/"+String:C10($_l_Month))
				If ($_d_Date1=$_d_Date2)
					$0:=4
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Date_Format"; $_t_oldMethodName)