If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.oFIlterDates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PRD_at_FilterDates;0)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_l_Dayof; $_l_Year)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.oFIlterDates"; Form event code:C388)

If (PRD_at_FilterDates>0)
	GOTO OBJECT:C206([PRODUCTS:9]Description:6)
	QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
	QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1)
	Case of 
		: (PRD_at_FilterDates{PRD_at_FilterDates}="Future Dates")
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=Current date:C33(*))
		: (PRD_at_FilterDates{PRD_at_FilterDates}="From Current Month")
			$_d_Date:=Current date:C33(*)
			$_l_Dayof:=Day of:C23(Current date:C33(*))
			If ($_l_Dayof>1)
				Repeat 
					$_d_Date:=$_d_Date-1
					$_l_Dayof:=Day of:C23($_d_Date)
				Until ($_l_Dayof=1)
			End if 
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=$_d_Date)
		: (PRD_at_FilterDates{PRD_at_FilterDates}="From Current Year")
			$_l_Year:=Year of:C25(Current date:C33(*))
			$_d_Date:=Date:C102("01/01/"+String:C10($_l_Year))
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=$_d_Date)
		Else 
			$_l_Year:=Num:C11(PRD_at_FilterDates{PRD_at_FilterDates})
			//$_l_Year:=Year of(Current date(*))
			$_d_Date:=Date:C102("01/01/"+String:C10($_l_Year))
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=$_d_Date)
			
	End case 
	ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.oFIlterDates"; $_t_oldMethodName)
