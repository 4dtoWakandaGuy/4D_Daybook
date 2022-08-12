If (False:C215)
	//object Name: [USER]CompanySelect.oPIOpenClosed
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_CompanyCodes;0)
	//ARRAY TEXT(SD_at_CompanyNames;0)
	C_LONGINT:C283($_l_event; $_l_ListBottom; $_l_ListRight; $_l_WindowBottom; $_l_WindowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $_l_WindowWidth; DB_l_ScreenSetting)
	C_PICTURE:C286(DB_Pi_OpenClosed)
	C_TEXT:C284($_t_oldMethodName; DB_t_Address)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CompanySelect.oPIOpenClosed"; Form event code:C388)
$_l_event:=Form event code:C388
DB_l_ScreenSetting:=Abs:C99(DB_l_ScreenSetting-1)
//GET PICTURE FROM LIBRARY(15518+DB_l_ScreenSetting; DB_Pi_OpenClosed)
DB_Pi_OpenClosed:=Get_Picture(15518+DB_l_ScreenSetting)
WS_AutoscreenSize(2; 210; 239+((410-239)*DB_l_ScreenSetting))
If (DB_l_ScreenSetting=0)
	OBJECT MOVE:C664(*; "oPIOpenClosed"; 191; 6; 191+27; 6+17; *)
Else 
	OBJECT MOVE:C664(*; "oPIOpenClosed"; 191; 6; (191+17); (6+24); *)
End if 
If (True:C214)
	If (DB_l_ScreenSetting=0)
		
		If (True:C214)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
			If ($_l_WindowWidth>239)
				$_l_WindowWidth:=239
			End if 
			$_l_WindowHeight:=$_l_WindowBottom-$_l_WindowTop
			$_l_ListRight:=$_l_WindowWidth-3
			$_l_ListBottom:=$_l_WindowHeight-(29+29)
			OBJECT MOVE:C664(*; "oCompanyNamesList"; 3; 29; $_l_ListRight; $_l_ListBottom; *)
			OBJECT MOVE:C664(*; "oIncludeCheckBox"; 3; $_l_ListBottom+5; 219; ($_l_ListBottom+5)+13; *)
			OBJECT MOVE:C664(*; "oSelectOne"; 3; (($_l_ListBottom+5)+13)+5; 111; ((($_l_ListBottom+5)+13)+26); *)
			OBJECT MOVE:C664(*; "oNewOne"; 122; (($_l_ListBottom+5)+13)+5; 220; ((($_l_ListBottom+5)+13)+26); *)
			OBJECT MOVE:C664(*; "oNewTwo"; 122; (($_l_ListBottom+5)+13)+5; 220; ((($_l_ListBottom+5)+13)+26); *)
			OBJECT MOVE:C664(*; "oAddressVariable"; $_l_ListRight+5; 29; $_l_ListRight+5; 29; *)
		End if 
	Else 
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		
		$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
		If ($_l_WindowWidth<409)
			$_l_WindowWidth:=409
		End if 
		$_l_WindowHeight:=$_l_WindowBottom-$_l_WindowTop
		$_l_ListRight:=$_l_WindowWidth-209
		$_l_ListBottom:=$_l_WindowHeight-(34+29)
		OBJECT MOVE:C664(*; "oCompanyNamesList"; 3; 34; $_l_ListRight; $_l_ListBottom; *)
		OBJECT MOVE:C664(*; "oIncludeCheckBox"; 3; $_l_ListBottom+5; $_l_ListRight; ($_l_ListBottom+5)+13; *)
		OBJECT MOVE:C664(*; "oSelectOne"; 3; (($_l_ListBottom+5)+13)+5; 111; ((($_l_ListBottom+5)+13)+26); *)
		OBJECT MOVE:C664(*; "oNewOne"; 122; (($_l_ListBottom+5)+13)+5; 220; ((($_l_ListBottom+5)+13)+26); *)
		OBJECT MOVE:C664(*; "oNewTwo"; 122; (($_l_ListBottom+5)+13)+5; 220; ((($_l_ListBottom+5)+13)+26); *)
		OBJECT MOVE:C664(*; "oAddressVariable"; $_l_ListRight+5; 34; $_l_ListRight+209-10; $_l_ListBottom; *)
		If (SD_at_CompanyNames>0)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=SD_at_CompanyCodes{SD_at_CompanyNames})
			DB_t_Address:=[COMPANIES:2]ADDRESS:60
			UNLOAD RECORD:C212([COMPANIES:2])
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].CompanySelect.oPIOpenClosed"; $_t_oldMethodName)
