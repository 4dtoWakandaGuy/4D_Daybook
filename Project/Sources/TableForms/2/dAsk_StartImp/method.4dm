If (False:C215)
	//Table Form Method Name: [COMPANIES]dAsk_StartImp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_UserNames;0)
	//ARRAY TEXT(DB_at_LoginMasked;0)
	//ARRAY TEXT(DB_at_UserLogin;0)
	//ARRAY TEXT(DB_at_UserNames;0)
	//ARRAY TEXT(DB_at_userType;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_PICTURE:C286(<>PictLogoMed)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vTitle1)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES]dAsk_StartImp"; Form event code:C388)

//$_t_oldMethodName:=ERR_MethodTracker ("FM [COMPANIES].dAsk_StartImp";Form event)
$_l_event:=Form event code:C388

If ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	
	//TRACE
	<>PictLogoMed:=Get_Picture(20240)
	//GET PICTURE FROM LIBRARY(20240; <>PictLogoMed)
	ARRAY TEXT:C222(DB_at_UserNames; 0)  //Note these are the personnel NOT the Daybook user names
	
	ARRAY TEXT:C222(DB_at_UserLogin; 0)
	ARRAY TEXT:C222(DB_at_LoginMasked; 0)
	ARRAY TEXT:C222(DB_at_userType; 0)
	GEN_at_Name:=1
	If (DB_t_CurrentFormUsage="Again")
		vTitle1:="If you are importing to a data file that already contains some information, "+"please note that this process may delete or overwrite that data."
	Else 
		vTitle1:="You have started Daybook with a new, blank set of data.  A number of setups "+"will be required, but this process can be largely automated."
	End if 
	vTitle1:=vTitle1+Char:C90(13)+Char:C90(13)+"Choose from the list below a description that most closely suits your business:"
	//`````````
	LB_SetupListbox(->DB_lb_UserNames; "SD2a_t"; "SD2a_L"; 1; ->DB_at_UserNames; ->DB_at_LoginMasked; ->DB_at_userType; ->DB_at_UserLogin)
	
	
	LB_SetColumnHeaders(->DB_lb_UserNames; "SD2a_L"; 1; "User Name"; "Login"; "Access Level"; "Login-Hidden")
	LB_SetColumnWidths(->DB_lb_UserNames; "SD2a_t"; 1; 120; 100; 0)
	LB_SetEnterable(->DB_lb_UserNames; False:C215; 0)
	If (Not:C34([DIARY:12]Done:14)) & ([DIARY:12]Result_Code:11="")  //if the diary is completed dont let adds happen
		
		LB_SetEnterable(->DB_lb_UserNames; True:C214; 2)
	End if 
	
	LB_SetScroll(->DB_lb_UserNames; -3; -2)
	LB_StyleSettings(->DB_lb_UserNames; "Black"; 9; "SD2a_t"; ->[DIARY:12])
	LB_Setdividers(->DB_lb_UserNames; 0; 0)  //Both off
	
	LBI_Scrollonresize(->DB_lb_UserNames)
	
	//```````````
	INT_SetDialog
	//SD2_SetDiaryPopup
End if 
ERR_MethodTrackerReturn("FM:dAsk_StartImp"; $_t_oldMethodName)
