If (False:C215)
	//Table Form Method Name: [DOCUMENTS]dAsk_Label
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 13:18
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_TableNumber; cNAA; cSIS; rComp; rCont; rDiary; Vt5Choose)
	C_POINTER:C301(DOC_p_CurrentTablePointer)
	C_REAL:C285(vT1; vT3; vT4; vT5)
	C_TEXT:C284($_t_oldMethodName; vT5Document)
	C_TIME:C306($_ti_DocRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].dAsk_Label"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DOCUMENTS:7]); "dAsk_Label")
		OBJECT SET VISIBLE:C603(Vt5Choose; False:C215)
		vT5Document:=""
		If (Not:C34(Is nil pointer:C315(DOC_p_CurrentTablePointer)))
			$_l_TableNumber:=Table:C252(DOC_p_CurrentTablePointer->)
			
			QUERY:C277([DATA_AUDITS:102]; [DATA_AUDITS:102]TABLE_NUMBER:2=-(404+$_l_TableNumber))
		End if 
		If (Records in selection:C76([DATA_AUDITS:102])>0)
			//there is a label to use
			OBJECT SET TITLE:C194(vT5; [DATA_AUDITS:102]DOCUMENT_NAME:5)
			If ([DATA_AUDITS:102]DOCUMENT_NAME:5#"")
				If (BLOB size:C605([DATA_AUDITS:102]DATA:6)>0)
					BLOB TO DOCUMENT:C526([DATA_AUDITS:102]DOCUMENT_NAME:5; [DATA_AUDITS:102]DATA:6)
				Else 
					$_ti_DocRef:=DB_CreateDocument([DATA_AUDITS:102]DOCUMENT_NAME:5; "TEXT"; "Create  Label template"; True:C214)
					CLOSE DOCUMENT:C267($_ti_DocRef)
					
				End if 
			End if 
			
		End if 
		
		
		vT1:=1
		If ((rComp#1) & (rCont#1) & (rDiary#1))
			OBJECT SET ENABLED:C1123(cNAA; False:C215)
			OBJECT SET ENABLED:C1123(vT3; False:C215)
			OBJECT SET ENABLED:C1123(vT4; False:C215)
		End if 
		cSIS:=1
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[DOCUMENTS:7])
		
End case 
ERR_MethodTrackerReturn("FM:dAsk_Label"; $_t_oldMethodName)
