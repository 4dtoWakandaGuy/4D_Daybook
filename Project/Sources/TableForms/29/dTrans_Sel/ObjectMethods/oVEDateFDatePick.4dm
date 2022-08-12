If (False:C215)
	//object Name: [TRANSACTIONS]dTrans_Sel.oVEDateFDatePick
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2012 13:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_WeekDaysOff; 0)
	ARRAY DATE:C224($_ad_DaysOff; 0)
	C_BOOLEAN:C305($_bo_Customise; DB_bo_NoLoad)
	C_DATE:C307(vDate)
	C_TEXT:C284($_t_oldMethodName; $_t_FormName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS].dTrans_Sel.oVEDateFDatePick"; Form event code:C388)

//PopupDate sample code

Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		SRCH_HandlePickerDates
		
	: (Form event code:C388=On Clicked:K2:4)
		SRCH_HandlePickerDates
		
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		// Init the var itself
		// this can be done anywhere else in your code
		
		// the let's customise the datepicker if needed;
		//  All exemples below are inactivated (if false)
		$_bo_Customise:=False:C215
		
		$_t_ObjectName:=OBJECT Get name:C1087(Object current:K67:2)
		
		// the line below is useless until you use "DatePicker SET DEFAULT…" commands
		
		// DatePicker RESET DEFAULT VALUES
		
		
		// the exemple below shows how to set days off of a week
		// just define a 7 rows boolean array and set days that are off to "true"
		// Tip : use 4D constants for code lisibility
		
		If ($_bo_Customise)
			ARRAY BOOLEAN:C223($_abo_WeekDaysOff; 7)  //lets say wednesday and sunday are days off
			$_abo_WeekDaysOff{Wednesday:K10:15}:=True:C214
			$_abo_WeekDaysOff{Sunday:K10:19}:=True:C214
			DatePicker SET DAYS OFF($_t_FormName; 0; ->$_abo_WeekDaysOff)  //0 means weekly days off
		End if 
		
		// the exemple below show how to define a min and a max enterable date
		// days before min and days after max will be dimmed
		// tip : use "Add to date" to avoid conflicts like 02/03 and 03/02
		// to set the 3rd feb 2009 as min date use "Add to date(!00/00/00!;2009;02;03) rather than 02/03/09 or 03/02/09
		//DatePicker SET MIN DATE ($_t_FormName;!01/01/2000!)
		//DatePicker SET MAX DATE ($_t_FormName;Current date)
		If ($_bo_Customise)
			//min date is current date minus 15 days
			//max date is current date plus 1 year
		End if 
		
		// The exemple below show how to define recurent days off (off every year at the same date)
		// exemple (for france) january 1st, may 1st, may 8th, july 14th, august 15th, november 1st, november 11th, december 25th
		// tip : use "Add to date" to avoid conflicts like 02/03 and 03/02
		// 2000 can be used as any other year… not taken into account.
		
		If ($_bo_Customise)
			ARRAY DATE:C224($_ad_DaysOff; 0)
			APPEND TO ARRAY:C911($_ad_DaysOff; Add to date:C393(!00-00-00!; 2000; 1; 1))  //january 1rst
			APPEND TO ARRAY:C911($_ad_DaysOff; Add to date:C393(!00-00-00!; 2000; 5; 1))
			APPEND TO ARRAY:C911($_ad_DaysOff; Add to date:C393(!00-00-00!; 2000; 5; 8))
			APPEND TO ARRAY:C911($_ad_DaysOff; Add to date:C393(!00-00-00!; 2000; 7; 14))
			APPEND TO ARRAY:C911($_ad_DaysOff; Add to date:C393(!00-00-00!; 2000; 8; 15))
			APPEND TO ARRAY:C911($_ad_DaysOff; Add to date:C393(!00-00-00!; 2000; 11; 1))
			APPEND TO ARRAY:C911($_ad_DaysOff; Add to date:C393(!00-00-00!; 2000; 11; 11))
			APPEND TO ARRAY:C911($_ad_DaysOff; Add to date:C393(!00-00-00!; 2000; 12; 25))  // december 25th
			
			DatePicker SET DAYS OFF($_t_FormName; 1; ->$_ad_DaysOff)  // 1 stands for every year
		End if 
		
		// The exemple below show how to define days off that are NOT recurent (NOT off every year at the same date)
		// Lets pretend June 27th is a particular in 2009
		// (in fact it is, it's my birthday, and shoud be recurent :-)
		
		If ($_bo_Customise)
			
			ARRAY DATE:C224($_ad_DaysOff; 0)
			APPEND TO ARRAY:C911($_ad_DaysOff; Add to date:C393(!00-00-00!; 2009; 6; 27))
			
			DatePicker SET DAYS OFF($_t_FormName; 2; ->$_ad_DaysOff)  // 2 stands for "only in 2009"
		End if 
		
		
		// The exemple below show how to define the first day of the week (default is monday)
		If ($_bo_Customise)
			DatePicker SET WEEK FIRST DAY($_t_FormName; Wednesday:K10:15)  // lets start the week on wednesday (why not)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS].dTrans_Sel.oVEDateFDatePick"; $_t_oldMethodName)
