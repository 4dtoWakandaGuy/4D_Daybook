If (False:C215)
	//Table Form Method Name: [COMPANIES]dRecordS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 14:44
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts; DB_bo_NoLoad)
	C_LONGINT:C283(<>AutoProc; $_l_event; vRecNo; xCount; xNext; xPlus; xSelect)
	C_TEXT:C284(<>RECTEXT; $_t_oldMethodName; vName; vProdName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dRecordS"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dRecordS")
		
		If ((DB_GetModuleSettingByNUM(Module_Macros))=3)
			OBJECT SET ENABLED:C1123(xPlus; False:C215)
			OBJECT SET ENABLED:C1123(xNext; False:C215)
			OBJECT SET ENABLED:C1123(xSelect; False:C215)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_Macros))>2)
			OBJECT SET ENABLED:C1123(xCount; False:C215)
		End if 
		
	: ($_l_event=On Outside Call:K2:11)
		Case of 
			: (<>AutoProc=686868)
				<>AutoProc:=0
				If (xSelect=1)
					xSelect:=0
					If (<>SCPT_bo_NoAutoScripts=False:C215)
						PLAY:C290("Mer Off"; 0)
					End if 
				End if 
				If (vName=vProdName)
					GOTO RECORD:C242([COMPANIES:2]; vRecNo)
					If (Records in selection:C76([SCRIPTS:80])=1)
						vName:=[SCRIPTS:80]Script_Code:1
						<>RecText:=[SCRIPTS:80]Recording_Text:4
					Else 
						<>RecText:=""
						vName:=""
					End if 
				End if 
		End case 
End case 
Record_BarLP
ERR_MethodTrackerReturn("FM:dRecordS"; $_t_oldMethodName)
