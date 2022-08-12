//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SetBankHols
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
	C_DATE:C307($_d_DateSet; $_d_DateTest; $_d_EasterSunday; $1)
	C_LONGINT:C283($_l_DayIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SetBankHols")
ARRAY DATE:C224(BAT_ad_BankHolidays; 8)
If ($1>Date:C102("01/01/"+String:C10(Year of:C25($1))))
	
	// it should be!!!
	BAT_ad_BankHolidays{1}:=Date:C102("01/01/"+String:C10(Year of:C25($1)+1))
	
Else 
	BAT_ad_BankHolidays{1}:=$1
End if 
//when is the first monday in may
For ($_l_DayIndex; 1; 7)
	$_d_DateTest:=Date:C102(String:C10($_l_DayIndex)+"/05/"+String:C10(Year of:C25($1)))
	
	
	If (Day number:C114($_d_DateTest)=2)
		//monday
		$_l_DayIndex:=7
	End if 
End for 



If ($1>$_d_DateTest)
	//after 1st may bank Holiday
	For ($_l_DayIndex; 1; 7)
		$_d_DateSet:=Date:C102(String:C10($_l_DayIndex)+"/05/"+String:C10(Year of:C25($1)+1))
		
		If (Day number:C114($_d_DateTest)=2)
			//monday
			$_l_DayIndex:=7
		End if 
	End for 
	BAT_ad_BankHolidays{2}:=$_d_DateSet
Else 
	BAT_ad_BankHolidays{2}:=$_d_DateTest
End if 
//````````
//when is the LAST monday in may
For ($_l_DayIndex; 31; (31-7); -1)
	$_d_DateTest:=Date:C102(String:C10($_l_DayIndex)+"/05/"+String:C10(Year of:C25($1)))
	
	If (Day number:C114($_d_DateTest)=2)
		//monday
		$_l_DayIndex:=0
	End if 
End for 


If ($1>$_d_DateTest)
	//after 31st may bank Holiday
	For ($_l_DayIndex; 31; (31-7); -1)
		$_d_DateSet:=Date:C102(String:C10($_l_DayIndex)+"/05/"+String:C10(Year of:C25($1)+1))
		
		If (Day number:C114($_d_DateTest)=2)
			//monday
			$_l_DayIndex:=0
		End if 
	End for 
	BAT_ad_BankHolidays{3}:=$_d_DateSet
Else 
	BAT_ad_BankHolidays{3}:=$_d_DateTest
End if 

//```
//Last monday in AUG
//````````
//when is the LAST monday in may
For ($_l_DayIndex; 31; (31-7); -1)
	$_d_DateTest:=Date:C102(String:C10($_l_DayIndex)+"/08/"+String:C10(Year of:C25($1)))
	
	If (Day number:C114($_d_DateTest)=2)
		//monday
		$_l_DayIndex:=0
	End if 
End for 


If ($1>$_d_DateTest)
	//after 31st AUG bank Holiday
	For ($_l_DayIndex; 31; (31-7); -1)
		$_d_DateSet:=Date:C102(String:C10($_l_DayIndex)+"/08/"+String:C10(Year of:C25($1)+1))
		
		If (Day number:C114($_d_DateTest)=2)
			//monday
			$_l_DayIndex:=1
		End if 
	End for 
	BAT_ad_BankHolidays{4}:=$_d_DateSet
Else 
	BAT_ad_BankHolidays{4}:=$_d_DateTest
End if 



If ($1>Date:C102("25/12/"+String:C10(Year of:C25($1))))
	
	
	
	BAT_ad_BankHolidays{5}:=Date:C102("25/12/"+String:C10(Year of:C25($1)+1))
	
Else 
	BAT_ad_BankHolidays{5}:=Date:C102("25/12/"+String:C10(Year of:C25($1)))
	
End if 
If ($1>Date:C102("26/12/"+String:C10(Year of:C25($1))))
	
	
	
	BAT_ad_BankHolidays{6}:=Date:C102("26/12/"+String:C10(Year of:C25($1)+1))
	
Else 
	BAT_ad_BankHolidays{6}:=Date:C102("26/12/"+String:C10(Year of:C25($1)))
	
End if 
$_d_EasterSunday:=WS_SetEaster(Year of:C25($1))
APPEND TO ARRAY:C911(BAT_ad_BankHolidays; $_d_EasterSunday+1)
APPEND TO ARRAY:C911(BAT_ad_BankHolidays; $_d_EasterSunday-2)
ERR_MethodTrackerReturn("SD_SetBankHols"; $_t_oldMethodName)
