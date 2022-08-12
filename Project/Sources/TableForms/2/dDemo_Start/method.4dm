If (False:C215)
	//Table Form Method Name: [COMPANIES]dDemo_Start
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>AutoProc; $_l_event; ch1; vProc)
	C_PICTURE:C286(<>PictLogoMed; <>PictLogoTxt)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vText; vTitle15; vTitle16; vTitle17; vTitle18)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dDemo_Start"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//GET PICTURE FROM LIBRARY(20240; <>PictLogoMed)
		<>PictLogoMed:=Get_Picture(20240)
		//GET PICTURE FROM LIBRARY(20230; <>PictLogoTxt)  //20230 BSW 6/09/02
		<>PictLogoTxt:=Get_Picture(20230)
		OpenHelp(Table:C252(->[COMPANIES:2]); "dDemo_Start")
		If (DB_t_CurrentFormUsage="Quit")
			vText:="Thank you for trying this Demonstration version of Daybook, the"
			vText:=vText+" Modular Business System."+Char:C90(13)+Char:C90(13)
		Else 
			vText:="This is a Demonstration version of Daybook, the Modular Business "
			vText:=vText+"System.  It is fully functional in every way except one: you are "
			vText:=vText+"restricted to a maximum of 200 records per file - for example, 200 "
			vText:=vText+"Companies, 200 Products and 200 Accounts Transactions.  When this "
			vText:=vText+"limit is reached, you will need to choose data to delete before "
			vText:=vText+"proceeding to make new entries."+Char:C90(13)+Char:C90(13)
		End if 
		vText:=vText+"If you would like to receive full access to the software, "
		vText:=vText+"or if you have any other enquiries, "
		vText:=vText+"please telephone or fax on the numbers given below."+Char:C90(13)+Char:C90(13)
		vText:=vText+"You may telephone the Daybook Helpline  "
		vText:=vText+"if you have returned your Registration Card."+Char:C90(13)+Char:C90(13)
		
		<>AutoProc:=0
		If (DB_t_CurrentFormUsage#"NC")
			ch1:=1
			vProc:=New process:C317("Close_After"; 64000; "("+String:C10(12-(3*Num:C11(DB_t_CurrentFormUsage="Quit ")))+";"+String:C10(Current process:C322)+")")
		End if 
		
		If ((DB_GetModuleSettingByNUM(1))=5)
			vTitle15:="Clearday Software ltd"
			vTitle16:="Sales Desk: 01296 3399199"
			vTitle17:=""
			vTitle18:="International Calls: ... +44..."
		Else 
			vTitle15:="Clearday Software ltd"
			vTitle16:="Sales Desk: 01296 3399199"
			vTitle17:=""
			vTitle18:="International Calls: ... +44..."
		End if 
		INT_SetDialog
	: (($_l_event=On Outside Call:K2:11) & (ch1=1))
		If (<>AutoProc=vProc)
			CANCEL:C270
		End if 
End case 
ERR_MethodTrackerReturn("FM:dDemo_Start"; $_t_oldMethodName)
