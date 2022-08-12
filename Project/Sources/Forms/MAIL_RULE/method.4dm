
If (False:C215)
	//Database Method Name:      MAIL_RULE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  21/11/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	//ARRAY LONGINT(PER_al_UsedObjectNumbers;0)
	ARRAY TEXT:C222($_at_Datas; 0)
	//ARRAY TEXT(PER_at_ActionCodes;0)
	//ARRAY TEXT(PER_at_ActionNames;0)
	//ARRAY TEXT(PER_at_MailContext;0)
	//ARRAY TEXT(PER_at_MailContext1;0)
	//ARRAY TEXT(PER_at_MailContext10;0)
	//ARRAY TEXT(PER_at_MailContext11;0)
	//ARRAY TEXT(PER_at_MailContext12;0)
	//ARRAY TEXT(PER_at_MailContext13;0)
	//ARRAY TEXT(PER_at_MailContext14;0)
	//ARRAY TEXT(PER_at_MailContext15;0)
	//ARRAY TEXT(PER_at_MailContext16;0)
	//ARRAY TEXT(PER_at_MailContext17;0)
	//ARRAY TEXT(PER_at_MailContext18;0)
	//ARRAY TEXT(PER_at_MailContext19;0)
	//ARRAY TEXT(PER_at_MailContext2;0)
	//ARRAY TEXT(PER_at_MailContext20;0)
	//ARRAY TEXT(PER_at_MailContext21;0)
	//ARRAY TEXT(PER_at_MailContext22;0)
	//ARRAY TEXT(PER_at_MailContext23;0)
	//ARRAY TEXT(PER_at_MailContext24;0)
	//ARRAY TEXT(PER_at_MailContext25;0)
	//ARRAY TEXT(PER_at_MailContext26;0)
	//ARRAY TEXT(PER_at_MailContext27;0)
	//ARRAY TEXT(PER_at_MailContext28;0)
	//ARRAY TEXT(PER_at_MailContext29;0)
	//ARRAY TEXT(PER_at_MailContext3;0)
	//ARRAY TEXT(PER_at_MailContext30;0)
	//ARRAY TEXT(PER_at_MailContext31;0)
	//ARRAY TEXT(PER_at_MailContext32;0)
	//ARRAY TEXT(PER_at_MailContext33;0)
	//ARRAY TEXT(PER_at_MailContext34;0)
	//ARRAY TEXT(PER_at_MailContext35;0)
	//ARRAY TEXT(PER_at_MailContext36;0)
	//ARRAY TEXT(PER_at_MailContext37;0)
	//ARRAY TEXT(PER_at_MailContext38;0)
	//ARRAY TEXT(PER_at_MailContext39;0)
	//ARRAY TEXT(PER_at_MailContext4;0)
	//ARRAY TEXT(PER_at_MailContext5;0)
	//ARRAY TEXT(PER_at_MailContext6;0)
	//ARRAY TEXT(PER_at_MailContext7;0)
	//ARRAY TEXT(PER_at_MailContext8;0)
	//ARRAY TEXT(PER_at_MailContext9;0)
	//ARRAY TEXT(PER_at_MailRuleFields;0)
	//ARRAY TEXT(PER_at_MailRuleFields1;0)
	//ARRAY TEXT(PER_at_MailRuleFields10;0)
	//ARRAY TEXT(PER_at_MailRuleFields11;0)
	//ARRAY TEXT(PER_at_MailRuleFields12;0)
	//ARRAY TEXT(PER_at_MailRuleFields13;0)
	//ARRAY TEXT(PER_at_MailRuleFields14;0)
	//ARRAY TEXT(PER_at_MailRuleFields15;0)
	//ARRAY TEXT(PER_at_MailRuleFields16;0)
	//ARRAY TEXT(PER_at_MailRuleFields17;0)
	//ARRAY TEXT(PER_at_MailRuleFields18;0)
	//ARRAY TEXT(PER_at_MailRuleFields19;0)
	//ARRAY TEXT(PER_at_MailRuleFields2;0)
	//ARRAY TEXT(PER_at_MailRuleFields20;0)
	//ARRAY TEXT(PER_at_MailRuleFields21;0)
	//ARRAY TEXT(PER_at_MailRuleFields22;0)
	//ARRAY TEXT(PER_at_MailRuleFields23;0)
	//ARRAY TEXT(PER_at_MailRuleFields24;0)
	//ARRAY TEXT(PER_at_MailRuleFields25;0)
	//ARRAY TEXT(PER_at_MailRuleFields26;0)
	//ARRAY TEXT(PER_at_MailRuleFields27;0)
	//ARRAY TEXT(PER_at_MailRuleFields28;0)
	//ARRAY TEXT(PER_at_MailRuleFields29;0)
	//ARRAY TEXT(PER_at_MailRuleFields3;0)
	//ARRAY TEXT(PER_at_MailRuleFields30;0)
	//ARRAY TEXT(PER_at_MailRuleFields31;0)
	//ARRAY TEXT(PER_at_MailRuleFields32;0)
	//ARRAY TEXT(PER_at_MailRuleFields33;0)
	//ARRAY TEXT(PER_at_MailRuleFields34;0)
	//ARRAY TEXT(PER_at_MailRuleFields35;0)
	//ARRAY TEXT(PER_at_MailRuleFields36;0)
	//ARRAY TEXT(PER_at_MailRuleFields37;0)
	//ARRAY TEXT(PER_at_MailRuleFields38;0)
	//ARRAY TEXT(PER_at_MailRuleFields39;0)
	//ARRAY TEXT(PER_at_MailRuleFields4;0)
	//ARRAY TEXT(PER_at_MailRuleFields40;0)
	//ARRAY TEXT(PER_at_MailRuleFields5;0)
	//ARRAY TEXT(PER_at_MailRuleFields6;0)
	//ARRAY TEXT(PER_at_MailRuleFields7;0)
	//ARRAY TEXT(PER_at_MailRuleFields8;0)
	//ARRAY TEXT(PER_at_MailRuleFields9;0)
	//ARRAY TEXT(PER_at_RuleScope;0)
	C_BOOLEAN:C305(PER_bo_ActionsInited)
	C_LONGINT:C283($_l_FormEvent; $_l_oBottom; $_l_OLeft; $_l_ORight; $_l_oTop; $_l_WindowBottom; $_l_WIndowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_OBJECT:C1216(PER_obj_MailRule)
	C_TEXT:C284($_t_oldMethodName; PER_t_MailRuleName; PER_t_MailRuleValue; PER_t_MailRuleValue1; PER_t_MailRuleValue10; PER_t_MailRuleValue11; PER_t_MailRuleValue12; PER_t_MailRuleValue13; PER_t_MailRuleValue14; PER_t_MailRuleValue15; PER_t_MailRuleValue16)
	C_TEXT:C284(PER_t_MailRuleValue17; PER_t_MailRuleValue18; PER_t_MailRuleValue19; PER_t_MailRuleValue2; PER_t_MailRuleValue20; PER_t_MailRuleValue21; PER_t_MailRuleValue22; PER_t_MailRuleValue23; PER_t_MailRuleValue24; PER_t_MailRuleValue25; PER_t_MailRuleValue26)
	C_TEXT:C284(PER_t_MailRuleValue27; PER_t_MailRuleValue28; PER_t_MailRuleValue29; PER_t_MailRuleValue3; PER_t_MailRuleValue30; PER_t_MailRuleValue31; PER_t_MailRuleValue32; PER_t_MailRuleValue33; PER_t_MailRuleValue34; PER_t_MailRuleValue35; PER_t_MailRuleValue36)
	C_TEXT:C284(PER_t_MailRuleValue37; PER_t_MailRuleValue38; PER_t_MailRuleValue39; PER_t_MailRuleValue4; PER_t_MailRuleValue5; PER_t_MailRuleValue6; PER_t_MailRuleValue7; PER_t_MailRuleValue8; PER_t_MailRuleValue9)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/MAIL_RULE/{formMethod}"; Form event code:C388)
$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Load:K2:1)
		
		If (Not:C34(PER_bo_ActionsInited))
			ALL RECORDS:C47([ACTIONS:13])
			//I may well be changing this to only actions that have the email element.
			//note that an incoming email is going to create a document. the eMail_Content is in the document
			SELECTION TO ARRAY:C260([ACTIONS:13]Action_Name:2; PER_at_ActionNames; [ACTIONS:13]Action_Code:1; PER_at_ActionCodes)
			SORT ARRAY:C229(PER_at_ActionNames; PER_at_ActionCodes; >)
		End if 
		ARRAY LONGINT:C221(PER_al_UsedObjectNumbers; 0)
		
		ARRAY TEXT:C222(PER_at_RuleScope; 0)
		
		APPEND TO ARRAY:C911(PER_at_RuleScope; "Any")
		APPEND TO ARRAY:C911(PER_at_RuleScope; "All")
		
		ARRAY TEXT:C222(PER_at_MailRuleFields; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields1; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields2; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields3; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields4; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields5; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields6; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields7; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields8; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields9; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields10; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields11; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields12; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields13; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields14; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields15; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields16; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields17; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields18; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields19; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields20; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields21; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields22; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields23; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields24; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields25; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields26; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields27; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields28; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields29; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields30; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields31; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields32; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields33; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields34; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields35; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields36; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields37; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields38; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields39; 0)
		ARRAY TEXT:C222(PER_at_MailRuleFields40; 0)
		APPEND TO ARRAY:C911(PER_at_MailRuleFields; "From")
		APPEND TO ARRAY:C911(PER_at_MailRuleFields; "Subject")
		APPEND TO ARRAY:C911(PER_at_MailRuleFields; "-")
		APPEND TO ARRAY:C911(PER_at_MailRuleFields; "Sender is in Database")
		APPEND TO ARRAY:C911(PER_at_MailRuleFields; "Sender is not in Database")
		APPEND TO ARRAY:C911(PER_at_MailRuleFields; "Sender Company is Type")
		APPEND TO ARRAY:C911(PER_at_MailRuleFields; "Sender Company Status is")
		APPEND TO ARRAY:C911(PER_at_MailRuleFields; "-")
		APPEND TO ARRAY:C911(PER_at_MailRuleFields; "Message Content")
		APPEND TO ARRAY:C911(PER_at_MailRuleFields; "-")
		APPEND TO ARRAY:C911(PER_at_MailRuleFields; "Message Has Attachment")
		
		
		ARRAY TEXT:C222(PER_at_MailContext; 0)
		ARRAY TEXT:C222(PER_at_MailContext1; 0)
		ARRAY TEXT:C222(PER_at_MailContext2; 0)
		ARRAY TEXT:C222(PER_at_MailContext3; 0)
		ARRAY TEXT:C222(PER_at_MailContext4; 0)
		ARRAY TEXT:C222(PER_at_MailContext5; 0)
		ARRAY TEXT:C222(PER_at_MailContext6; 0)
		ARRAY TEXT:C222(PER_at_MailContext7; 0)
		ARRAY TEXT:C222(PER_at_MailContext8; 0)
		ARRAY TEXT:C222(PER_at_MailContext9; 0)
		ARRAY TEXT:C222(PER_at_MailContext10; 0)
		ARRAY TEXT:C222(PER_at_MailContext11; 0)
		ARRAY TEXT:C222(PER_at_MailContext12; 0)
		ARRAY TEXT:C222(PER_at_MailContext13; 0)
		ARRAY TEXT:C222(PER_at_MailContext14; 0)
		ARRAY TEXT:C222(PER_at_MailContext15; 0)
		ARRAY TEXT:C222(PER_at_MailContext16; 0)
		ARRAY TEXT:C222(PER_at_MailContext17; 0)
		ARRAY TEXT:C222(PER_at_MailContext18; 0)
		ARRAY TEXT:C222(PER_at_MailContext19; 0)
		ARRAY TEXT:C222(PER_at_MailContext20; 0)
		ARRAY TEXT:C222(PER_at_MailContext21; 0)
		ARRAY TEXT:C222(PER_at_MailContext22; 0)
		ARRAY TEXT:C222(PER_at_MailContext23; 0)
		ARRAY TEXT:C222(PER_at_MailContext24; 0)
		ARRAY TEXT:C222(PER_at_MailContext25; 0)
		ARRAY TEXT:C222(PER_at_MailContext26; 0)
		ARRAY TEXT:C222(PER_at_MailContext27; 0)
		ARRAY TEXT:C222(PER_at_MailContext28; 0)
		ARRAY TEXT:C222(PER_at_MailContext29; 0)
		ARRAY TEXT:C222(PER_at_MailContext30; 0)
		ARRAY TEXT:C222(PER_at_MailContext31; 0)
		ARRAY TEXT:C222(PER_at_MailContext32; 0)
		ARRAY TEXT:C222(PER_at_MailContext33; 0)
		ARRAY TEXT:C222(PER_at_MailContext34; 0)
		ARRAY TEXT:C222(PER_at_MailContext35; 0)
		ARRAY TEXT:C222(PER_at_MailContext36; 0)
		ARRAY TEXT:C222(PER_at_MailContext37; 0)
		ARRAY TEXT:C222(PER_at_MailContext38; 0)
		ARRAY TEXT:C222(PER_at_MailContext39; 0)
		
		APPEND TO ARRAY:C911(PER_at_MailContext; "Contains")
		APPEND TO ARRAY:C911(PER_at_MailContext; "Does Not Contain")
		APPEND TO ARRAY:C911(PER_at_MailContext; "Begins With")
		APPEND TO ARRAY:C911(PER_at_MailContext; "Ends With")
		APPEND TO ARRAY:C911(PER_at_MailContext; "is equal to")
		PER_t_MailRuleValue:=""
		PER_t_MailRuleValue1:=""
		PER_t_MailRuleValue2:=""
		PER_t_MailRuleValue3:=""
		PER_t_MailRuleValue4:=""
		PER_t_MailRuleValue5:=""
		PER_t_MailRuleValue6:=""
		PER_t_MailRuleValue7:=""
		PER_t_MailRuleValue8:=""
		PER_t_MailRuleValue9:=""
		PER_t_MailRuleValue10:=""
		PER_t_MailRuleValue11:=""
		PER_t_MailRuleValue12:=""
		PER_t_MailRuleValue13:=""
		PER_t_MailRuleValue14:=""
		PER_t_MailRuleValue15:=""
		PER_t_MailRuleValue16:=""
		PER_t_MailRuleValue17:=""
		PER_t_MailRuleValue18:=""
		PER_t_MailRuleValue19:=""
		PER_t_MailRuleValue20:=""
		PER_t_MailRuleValue21:=""
		PER_t_MailRuleValue22:=""
		PER_t_MailRuleValue23:=""
		PER_t_MailRuleValue24:=""
		PER_t_MailRuleValue25:=""
		PER_t_MailRuleValue26:=""
		PER_t_MailRuleValue27:=""
		PER_t_MailRuleValue28:=""
		PER_t_MailRuleValue29:=""
		PER_t_MailRuleValue30:=""
		PER_t_MailRuleValue31:=""
		PER_t_MailRuleValue32:=""
		PER_t_MailRuleValue33:=""
		PER_t_MailRuleValue34:=""
		PER_t_MailRuleValue35:=""
		PER_t_MailRuleValue36:=""
		PER_t_MailRuleValue37:=""
		PER_t_MailRuleValue38:=""
		PER_t_MailRuleValue39:=""
		OB GET PROPERTY NAMES:C1232(PER_obj_MailRule; $_at_Datas; $_al_PropertyTypes)
		//this is the setting for this one rule
		If (Size of array:C274($_at_Datas)>0)
		Else 
			PER_at_ActionNames:=0
			PER_at_RuleScope:=2
			PER_at_MailRuleFields:=0
			PER_at_MailContext:=0
			OBJECT SET ENTERABLE:C238(*; "oRuleValue"; False:C215)
			OBJECT SET ENABLED:C1123(*; "oDelCondition"; False:C215)
			OBJECT SET ENABLED:C1123(*; "oAddCondition"; False:C215)
			OBJECT GET COORDINATES:C663(*; "oRuleField"; $_l_OLeft; $_l_oTop; $_l_ORight; $_l_oBottom)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_WIndowHeight:=($_l_WindowBottom-$_l_windowTop)+18
			If ($_l_WIndowHeight<($_l_oBottom+100))
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_windowTop+18+($_l_oBottom+150))
			End if 
			
		End if 
		
		OBJECT SET ENABLED:C1123(*; "oRuleField"; (PER_t_MailRuleName#""))
		OBJECT SET ENABLED:C1123(*; "oRuleContext"; (PER_t_MailRuleName#""))
		
		
		//to keep life simple the 'fields' that are 'true/false' hide the other columns(Context and rule value), they set them to a default of is equal to and true.so that make everyhting simpler. If we add other options we might need to amend this.
End case 
ERR_MethodTrackerReturn("FM [projectForm]/MAIL_RULE/{formMethod}"; $_t_oldMethodName)
