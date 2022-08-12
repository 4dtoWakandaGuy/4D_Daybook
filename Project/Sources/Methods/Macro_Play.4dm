//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_Play
	//------------------ Method Notes ------------------ 
	
	//------------------ Revision Control ----------------
	//Date Created:  24/09/2011 11:08 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>ButtPress)
	//C_UNKNOWN($1)
	//C_UNKNOWN($2)
	//C_UNKNOWN($4)
	//C_UNKNOWN($5)
	//C_UNKNOWN(MAC_PRINTED)
	//C_UNKNOWN(SQL_Use_Access_Rights)
	//C_UNKNOWN(vMPage)
	//C_UNKNOWN(vMTitle3)
	//C_UNKNOWN(vMTitle4)
	ARRAY BOOLEAN:C223($_abo_Parameters; 0)
	ARRAY DATE:C224($_ad_Dates; 0)
	ARRAY LONGINT:C221($_al_Parameters; 0)
	ARRAY PICTURE:C279($_apic_Parameters; 0)
	ARRAY POINTER:C280($_aPtr_ParameterTopass; 0)
	ARRAY REAL:C219($_ar_Parameters; 0)
	ARRAY TEXT:C222($_at_2DParameters; 0; 0)
	ARRAY TEXT:C222($_at_2DTextBlocks; 0; 0)
	ARRAY TEXT:C222($_at_Commands; 0)
	ARRAY TEXT:C222($_at_Conjuctions; 0; 0)
	ARRAY TEXT:C222($_at_ExternalBlocks; 0)
	ARRAY TEXT:C222($_at_Parameters; 0)
	ARRAY TEXT:C222($_at_ProcessCommands; 0)
	//ARRAY TEXT(MAC_at_LiteralString;0)
	ARRAY TIME:C1223($_ati_Times; 0)
	C_BLOB:C604(MAC_Bl_Blobs1; MAC_Bl_Blobs100; MAC_Bl_Blobs11; MAC_Bl_Blobs12; MAC_Bl_Blobs13; MAC_Bl_Blobs14; MAC_Bl_Blobs15; MAC_Bl_Blobs16; MAC_Bl_Blobs17; MAC_Bl_Blobs18; MAC_Bl_Blobs19)
	C_BLOB:C604(MAC_Bl_Blobs2; MAC_Bl_Blobs21; MAC_Bl_Blobs22; MAC_Bl_Blobs23; MAC_Bl_Blobs24; MAC_Bl_Blobs25; MAC_Bl_Blobs26; MAC_Bl_Blobs27; MAC_Bl_Blobs28; MAC_Bl_Blobs29; MAC_Bl_Blobs3)
	C_BLOB:C604(MAC_Bl_Blobs30; MAC_Bl_Blobs32; MAC_Bl_Blobs33; MAC_Bl_Blobs34; MAC_Bl_Blobs35; MAC_Bl_Blobs36; MAC_Bl_Blobs37; MAC_Bl_Blobs38; MAC_Bl_Blobs39; MAC_Bl_Blobs4; MAC_Bl_Blobs40)
	C_BLOB:C604(MAC_Bl_Blobs41; MAC_Bl_Blobs43; MAC_Bl_Blobs44; MAC_Bl_Blobs45; MAC_Bl_Blobs46; MAC_Bl_Blobs47; MAC_Bl_Blobs48; MAC_Bl_Blobs49; MAC_Bl_Blobs5; MAC_Bl_Blobs50; MAC_Bl_Blobs51)
	C_BLOB:C604(MAC_Bl_Blobs52; MAC_Bl_Blobs54; MAC_Bl_Blobs55; MAC_Bl_Blobs56; MAC_Bl_Blobs57; MAC_Bl_Blobs58; MAC_Bl_Blobs59; MAC_Bl_Blobs6; MAC_Bl_Blobs60; MAC_Bl_Blobs61; MAC_Bl_Blobs62)
	C_BLOB:C604(MAC_Bl_Blobs63; MAC_Bl_Blobs65; MAC_Bl_Blobs66; MAC_Bl_Blobs67; MAC_Bl_Blobs68; MAC_Bl_Blobs69; MAC_Bl_Blobs7; MAC_Bl_Blobs70; MAC_Bl_Blobs71; MAC_Bl_Blobs72; MAC_Bl_Blobs73)
	C_BLOB:C604(MAC_Bl_Blobs74; MAC_Bl_Blobs76; MAC_Bl_Blobs77; MAC_Bl_Blobs78; MAC_Bl_Blobs79; MAC_Bl_Blobs8; MAC_Bl_Blobs80; MAC_Bl_Blobs81; MAC_Bl_Blobs82; MAC_Bl_Blobs83; MAC_Bl_Blobs84)
	C_BLOB:C604(MAC_Bl_Blobs85; MAC_Bl_Blobs87; MAC_Bl_Blobs88; MAC_Bl_Blobs89; MAC_Bl_Blobs9; MAC_Bl_Blobs90; MAC_Bl_Blobs91; MAC_Bl_Blobs92; MAC_Bl_Blobs93; MAC_Bl_Blobs94; MAC_Bl_Blobs95)
	C_BLOB:C604(MAC_Bl_Blobs96; MAC_Bl_Blobs98; MAC_Bl_Blobs10; MAC_Bl_Blobs20; MAC_Bl_Blobs31; MAC_Bl_Blobs42; MAC_Bl_Blobs53; MAC_Bl_Blobs64; MAC_Bl_Blobs75; MAC_Bl_Blobs86; MAC_Bl_Blobs97)
	C_BLOB:C604(MAC_Bl_Blobs99)
	C_BOOLEAN:C305(<>SYS_bo_StopMacros; $_bo_CaseOfHandling; $_bo_EndCase; $_bo_ExecuteCommand; $_bo_ExecuteElse; $_bo_ExecuteOnServer; $_bo_ExecuteSQL; $_bo_ForStatement; $_bo_IfHandling; $_bo_InternetServer; $_bo_isaField)
	C_BOOLEAN:C305($_bo_isaTable; $_bo_lineIsTrue; $_bo_NoRun; $_bo_NoStart; $_bo_noStop; $_bo_RepeatStatement; $_bo_ThisValue; $_bo_ThisValue10; $_bo_ThisValue11; $_bo_ThisValue12; $_bo_ThisValue13)
	C_BOOLEAN:C305($_bo_ThisValue14; $_bo_ThisValue15; $_bo_ThisValue16; $_bo_ThisValue17; $_bo_ThisValue18; $_bo_ThisValue19; $_bo_ThisValue2; $_bo_ThisValue3; $_bo_ThisValue4; $_bo_ThisValue5; $_bo_ThisValue6)
	C_BOOLEAN:C305($_bo_ThisValue7; $_bo_ThisValue8; $_bo_ThisValue9; $_bo_UniqueProcess; $_bo_WhileHandling; $_bo_WhileStatement; $_bo_WindowOpen; MAC_bo_LineIsTrue; MAC_PRINTED; <>SYS_bo_StopMacros; $_bo_CaseOfHandling)
	C_BOOLEAN:C305($_bo_EndCase; $_bo_ExecuteCommand; $_bo_ExecuteElse; $_bo_ExecuteOnServer; $_bo_ExecuteSQL; $_bo_ForStatement; $_bo_IfHandling; $_bo_InternetServer; $_bo_isaField; $_bo_isaTable; $_bo_lineIsTrue)
	C_BOOLEAN:C305($_bo_NoRun; $_bo_NoStart; $_bo_noStop; $_bo_RepeatStatement; $_bo_ThisValue; $_bo_ThisValue10; $_bo_ThisValue11; $_bo_ThisValue12; $_bo_ThisValue13; $_bo_ThisValue14; $_bo_ThisValue15)
	C_BOOLEAN:C305($_bo_ThisValue16; $_bo_ThisValue17; $_bo_ThisValue18; $_bo_ThisValue19; $_bo_ThisValue2; $_bo_ThisValue3; $_bo_ThisValue4; $_bo_ThisValue5; $_bo_ThisValue6; $_bo_ThisValue7; $_bo_ThisValue8)
	C_BOOLEAN:C305($_bo_ThisValue9; $_bo_UniqueProcess; $_bo_WhileHandling; $_bo_WhileStatement; $_bo_WindowOpen; MAC_bo_LineIsTrue)
	C_DATE:C307($_d_ThisValue; $_d_ThisValue10; $_d_ThisValue11; $_d_ThisValue12; $_d_ThisValue13; $_d_ThisValue14; $_d_ThisValue15; $_d_ThisValue16; $_d_ThisValue17; $_d_ThisValue18; $_d_ThisValue19)
	C_DATE:C307($_d_ThisValue2; $_d_ThisValue3; $_d_ThisValue4; $_d_ThisValue5; $_d_ThisValue6; $_d_ThisValue7; $_d_ThisValue8; $_d_ThisValue9; $_d_ThisValue; $_d_ThisValue10; $_d_ThisValue11)
	C_DATE:C307($_d_ThisValue12; $_d_ThisValue13; $_d_ThisValue14; $_d_ThisValue15; $_d_ThisValue16; $_d_ThisValue17; $_d_ThisValue18; $_d_ThisValue19; $_d_ThisValue2; $_d_ThisValue3; $_d_ThisValue4)
	C_DATE:C307($_d_ThisValue5; $_d_ThisValue6; $_d_ThisValue7; $_d_ThisValue8; $_d_ThisValue9)
	C_LONGINT:C283(<>SYS_l_CancelProcess; <>SYS_l_WindowTop; $_l_BlobReference; $_l_CaseofIndex; $_l_CharacterPosition; $_l_CNP; $_l_CommandPosition; $_l_DataType; $_l_End2; $_l_EndBracketPosition; $_l_EndBraketPosition)
	C_LONGINT:C283($_l_endStatementIndex; $_l_EndTableBracketPosition; $_l_Execute; $_l_exIndex; $_l_FieldCount; $_l_FieldNumber; $_l_Fill2Index; $_l_FillIndex; $_l_FindFIeldIndex; $_l_FindTableIndex; $_l_Increment2)
	C_LONGINT:C283($_l_Index2; $_l_Key; $_l_LastLine; $_l_Memory; $_l_MemoryStack; $_l_MouseX; $_l_MouseX2; $_l_MouseY; $_l_NewProcessID; $_l_Number1; $_l_Number2)
	C_LONGINT:C283($_l_Number3; $_l_NumberofColumns; $_l_NumberofLines; $_l_OpenBracketPosition; $_l_ParametersCount; $_l_Process; $_l_ProcessNumber; $_l_RepeatLine; $_l_Right; $_l_Row; $_l_ScriptLevel)
	C_LONGINT:C283($_l_SemiColonPosition; $_l_Start2; $_l_StringLength; $_l_TableNumber; $_l_WhileLine; $MAC_l_MessageWindow; DB_l_ButtonClickedFunction; MAC_l_end; MAC_l_end0; MAC_l_end1; MAC_l_end10)
	C_LONGINT:C283(MAC_l_end11; MAC_l_end12; MAC_l_end13; MAC_l_end14; MAC_l_end15; MAC_l_end16; MAC_l_end17; MAC_l_end18; MAC_l_end19; MAC_l_end2; MAC_l_end20)
	C_LONGINT:C283(MAC_l_end22; MAC_l_end23; MAC_l_end24; MAC_l_end25; MAC_l_end26; MAC_l_end27; MAC_l_end28; MAC_l_end29; MAC_l_end3; MAC_l_end30; MAC_l_end31)
	C_LONGINT:C283(MAC_l_end32; MAC_l_end34; MAC_l_end35; MAC_l_end36; MAC_l_end37; MAC_l_end38; MAC_l_end39; MAC_l_end4; MAC_l_end40; MAC_l_end41; MAC_l_end42)
	C_LONGINT:C283(MAC_l_end43; MAC_l_end45; MAC_l_end46; MAC_l_end47; MAC_l_end48; MAC_l_end49; MAC_l_end5; MAC_l_end50; MAC_l_end51; MAC_l_end52; MAC_l_end53)
	C_LONGINT:C283(MAC_l_end54; MAC_l_end56; MAC_l_end57; MAC_l_end58; MAC_l_end59; MAC_l_end6; MAC_l_end60; MAC_l_end61; MAC_l_end62; MAC_l_end63; MAC_l_end64)
	C_LONGINT:C283(MAC_l_end65; MAC_l_end67; MAC_l_end68; MAC_l_end69; MAC_l_end7; MAC_l_end70; MAC_l_end71; MAC_l_end72; MAC_l_end73; MAC_l_end74; MAC_l_end75)
	C_LONGINT:C283(MAC_l_end78; MAC_l_end79; MAC_l_end8; MAC_l_end80; MAC_l_end81; MAC_l_end82; MAC_l_end83; MAC_l_end84; MAC_l_end85; MAC_l_end86; MAC_l_end87)
	C_LONGINT:C283(MAC_l_end89; MAC_l_end9; MAC_l_end90; MAC_l_end91; MAC_l_end92; MAC_l_end93; MAC_l_end94; MAC_l_end95; MAC_l_end96; MAC_l_end97; MAC_l_end98)
	C_LONGINT:C283(MAC_l_Increment; MAC_l_Increment0; MAC_l_Increment1; MAC_l_Increment10; MAC_l_Increment100; MAC_l_Increment11; MAC_l_Increment12; MAC_l_Increment13; MAC_l_Increment14; MAC_l_Increment15; MAC_l_Increment17)
	C_LONGINT:C283(MAC_l_Increment18; MAC_l_Increment19; MAC_l_Increment2; MAC_l_Increment20; MAC_l_Increment21; MAC_l_Increment22; MAC_l_Increment23; MAC_l_Increment24; MAC_l_Increment25; MAC_l_Increment26; MAC_l_Increment28)
	C_LONGINT:C283(MAC_l_Increment29; MAC_l_Increment3; MAC_l_Increment30; MAC_l_Increment31; MAC_l_Increment32; MAC_l_Increment33; MAC_l_Increment34; MAC_l_Increment35; MAC_l_Increment36; MAC_l_Increment37; MAC_l_Increment39)
	C_LONGINT:C283(MAC_l_Increment4; MAC_l_Increment40; MAC_l_Increment41; MAC_l_Increment42; MAC_l_Increment43; MAC_l_Increment44; MAC_l_Increment45; MAC_l_Increment46; MAC_l_Increment47; MAC_l_Increment48; MAC_l_Increment5)
	C_LONGINT:C283(MAC_l_Increment50; MAC_l_Increment51; MAC_l_Increment52; MAC_l_Increment53; MAC_l_Increment54; MAC_l_Increment55; MAC_l_Increment56; MAC_l_Increment57; MAC_l_Increment58; MAC_l_Increment59; MAC_l_Increment60)
	C_LONGINT:C283(MAC_l_Increment61; MAC_l_Increment62; MAC_l_Increment63; MAC_l_Increment64; MAC_l_Increment65; MAC_l_Increment66; MAC_l_Increment67; MAC_l_Increment68; MAC_l_Increment69; MAC_l_Increment7; MAC_l_Increment71)
	C_LONGINT:C283(MAC_l_Increment72; MAC_l_Increment73; MAC_l_Increment74; MAC_l_Increment75; MAC_l_Increment76; MAC_l_Increment77; MAC_l_Increment78; MAC_l_Increment79; MAC_l_Increment8; MAC_l_Increment80; MAC_l_Increment82)
	C_LONGINT:C283(MAC_l_Increment83; MAC_l_Increment84; MAC_l_Increment85; MAC_l_Increment86; MAC_l_Increment87; MAC_l_Increment89; MAC_l_Increment9; MAC_l_Increment90; MAC_l_Increment91; MAC_l_Increment92; MAC_l_Increment94)
	C_LONGINT:C283(MAC_l_Increment95; MAC_l_Increment96; MAC_l_Increment97; MAC_l_Increment98; MAC_l_Increment99; MAC_l_Index; MAC_l_Index0; MAC_l_Index1; MAC_l_Index10; MAC_l_Index100; MAC_l_Index12)
	C_LONGINT:C283(MAC_l_Index13; MAC_l_Index14; MAC_l_Index15; MAC_l_Index16; MAC_l_Index17; MAC_l_Index18; MAC_l_Index19; MAC_l_Index2; MAC_l_Index20; MAC_l_Index21; MAC_l_Index23)
	C_LONGINT:C283(MAC_l_Index24; MAC_l_Index25; MAC_l_Index26; MAC_l_Index27; MAC_l_Index28; MAC_l_Index29; MAC_l_Index3; MAC_l_Index30; MAC_l_Index31; MAC_l_Index32; MAC_l_Index34)
	C_LONGINT:C283(MAC_l_Index35; MAC_l_Index36; MAC_l_Index37; MAC_l_Index38; MAC_l_Index39; MAC_l_Index4; MAC_l_Index40; MAC_l_Index41; MAC_l_Index42; MAC_l_Index43; MAC_l_Index45)
	C_LONGINT:C283(MAC_l_Index46; MAC_l_Index47; MAC_l_Index48; MAC_l_Index49; MAC_l_Index5; MAC_l_Index50; MAC_l_Index51; MAC_l_Index52; MAC_l_Index53; MAC_l_Index54; MAC_l_Index56)
	C_LONGINT:C283(MAC_l_Index57; MAC_l_Index58; MAC_l_Index59; MAC_l_Index6; MAC_l_Index60; MAC_l_Index61; MAC_l_Index62; MAC_l_Index63; MAC_l_Index64; MAC_l_Index65; MAC_l_Index67)
	C_LONGINT:C283(MAC_l_Index68; MAC_l_Index69; MAC_l_Index7; MAC_l_Index70; MAC_l_Index71; MAC_l_Index72; MAC_l_Index73; MAC_l_Index74; MAC_l_Index75; MAC_l_Index76; MAC_l_Index78)
	C_LONGINT:C283(MAC_l_Index79; MAC_l_Index8; MAC_l_Index80; MAC_l_Index81; MAC_l_Index82; MAC_l_Index83; MAC_l_Index84; MAC_l_Index85; MAC_l_Index86; MAC_l_Index87; MAC_l_Index89)
	C_LONGINT:C283(MAC_l_Index9; MAC_l_Index90; MAC_l_Index91; MAC_l_Index92; MAC_l_Index93; MAC_l_Index95; MAC_l_Index96; MAC_l_Index97; MAC_l_Index98; MAC_l_Index99; MAC_l_MessageWindow)
	C_LONGINT:C283(MAC_l_start; MAC_l_start0; MAC_l_start1; MAC_l_start10; MAC_l_start100; MAC_l_start11; MAC_l_start12; MAC_l_start13; MAC_l_start14; MAC_l_start15; MAC_l_start17)
	C_LONGINT:C283(MAC_l_start18; MAC_l_start19; MAC_l_start2; MAC_l_start20; MAC_l_start21; MAC_l_start22; MAC_l_start23; MAC_l_start24; MAC_l_start25; MAC_l_start26; MAC_l_start28)
	C_LONGINT:C283(MAC_l_start29; MAC_l_start3; MAC_l_start30; MAC_l_start31; MAC_l_start32; MAC_l_start33; MAC_l_start34; MAC_l_start35; MAC_l_start36; MAC_l_start37; MAC_l_start39)
	C_LONGINT:C283(MAC_l_start4; MAC_l_start40; MAC_l_start41; MAC_l_start42; MAC_l_start43; MAC_l_start44; MAC_l_start45; MAC_l_start46; MAC_l_start47; MAC_l_start48; MAC_l_start5)
	C_LONGINT:C283(MAC_l_start50; MAC_l_start51; MAC_l_start52; MAC_l_start53; MAC_l_start54; MAC_l_start55; MAC_l_start56; MAC_l_start57; MAC_l_start58; MAC_l_start59; MAC_l_start60)
	C_LONGINT:C283(MAC_l_start61; MAC_l_start62; MAC_l_start63; MAC_l_start64; MAC_l_start65; MAC_l_start66; MAC_l_start67; MAC_l_start68; MAC_l_start69; MAC_l_start7; MAC_l_start71)
	C_LONGINT:C283(MAC_l_start72; MAC_l_start73; MAC_l_start74; MAC_l_start75; MAC_l_start76; MAC_l_start77; MAC_l_start78; MAC_l_start79; MAC_l_start8; MAC_l_start80; MAC_l_start82)
	C_LONGINT:C283(MAC_l_start83; MAC_l_start84; MAC_l_start85; MAC_l_start86; MAC_l_start87; MAC_l_start88; MAC_l_start89; MAC_l_start9; MAC_l_start90; MAC_l_start91; MAC_l_start93)
	C_LONGINT:C283(MAC_l_start94; MAC_l_start96; MAC_l_start97; MAC_l_start98; MAC_l_start99; SCPT_l_Cancel; vMPage; <>SYS_l_CancelProcess; <>SYS_l_WindowTop; $_l_BlobReference; $_l_CaseofIndex)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CNP; $_l_CommandPosition; $_l_DataType; $_l_End2; $_l_EndBracketPosition; $_l_EndBraketPosition; $_l_endStatementIndex; $_l_EndTableBracketPosition; $_l_Execute; $_l_exIndex)
	C_LONGINT:C283($_l_FieldCount; $_l_FieldNumber; $_l_Fill2Index; $_l_FillIndex; $_l_FindFIeldIndex; $_l_FindTableIndex; $_l_Increment2; $_l_Index2; $_l_Key; $_l_LastLine; $_l_Memory)
	C_LONGINT:C283($_l_MemoryStack; $_l_Mousex; $_l_MouseX2; $_l_Mousey; $_l_NewProcessID; $_l_Number1; $_l_Number2; $_l_Number3; $_l_NumberofColumns; $_l_NumberofLines; $_l_OpenBracketPosition)
	C_LONGINT:C283($_l_ParametersCount; $_l_Process; $_l_ProcessNumber; $_l_RepeatLine; $_l_Right; $_l_Row; $_l_ScriptLevel; $_l_SemiColonPosition; $_l_Start2; $_l_StringLength; $_l_TableNumber)
	C_LONGINT:C283($_l_WhileLine; $MAC_l_MessageWindow; DB_l_ButtonClickedFunction; MAC_l_end; MAC_l_end100; MAC_l_end21; MAC_l_end33; MAC_l_end44; MAC_l_end55; MAC_l_end66; MAC_l_end76)
	C_LONGINT:C283(MAC_l_end77; MAC_l_end88; MAC_l_end99; MAC_l_Increment; MAC_l_Increment16; MAC_l_Increment27; MAC_l_Increment38; MAC_l_Increment49; MAC_l_Increment6; MAC_l_Increment70; MAC_l_Increment81)
	C_LONGINT:C283(MAC_l_Increment88; MAC_l_Increment93; MAC_l_Index; MAC_l_Index11; MAC_l_Index22; MAC_l_Index33; MAC_l_Index44; MAC_l_Index55; MAC_l_Index66; MAC_l_Index77; MAC_l_Index88)
	C_LONGINT:C283(MAC_l_Index94; MAC_l_MessageWindow; MAC_l_start; MAC_l_start16; MAC_l_start27; MAC_l_start38; MAC_l_start49; MAC_l_start6; MAC_l_start70; MAC_l_start81; MAC_l_start92)
	C_LONGINT:C283(MAC_l_start95; SCPT_l_Cancel)
	C_PICTURE:C286($_pic_ThisValue; $_pic_ThisValue10; $_pic_ThisValue11; $_pic_ThisValue12; $_pic_ThisValue13; $_pic_ThisValue14; $_pic_ThisValue15; $_pic_ThisValue16; $_pic_ThisValue17; $_pic_ThisValue18; $_pic_ThisValue19)
	C_PICTURE:C286($_pic_ThisValue2; $_pic_ThisValue3; $_pic_ThisValue4; $_pic_ThisValue5; $_pic_ThisValue6; $_pic_ThisValue7; $_pic_ThisValue8; $_pic_ThisValue9; $nulPic; $_pic_ThisValue; $_pic_ThisValue10)
	C_PICTURE:C286($_pic_ThisValue11; $_pic_ThisValue12; $_pic_ThisValue13; $_pic_ThisValue14; $_pic_ThisValue15; $_pic_ThisValue16; $_pic_ThisValue17; $_pic_ThisValue18; $_pic_ThisValue19; $_pic_ThisValue2; $_pic_ThisValue3)
	C_PICTURE:C286($_pic_ThisValue4; $_pic_ThisValue5; $_pic_ThisValue6; $_pic_ThisValue7; $_pic_ThisValue8; $_pic_ThisValue9)
	C_POINTER:C301($_ptr_6; $_ptr_DataVariable; $_ptr_FieldPointer; $_ptr_index; $_ptr_Parameter1; $_ptr_Parameter10; $_ptr_Parameter11; $_ptr_Parameter12; $_ptr_Parameter13; $_ptr_Parameter14; $_ptr_Parameter15)
	C_POINTER:C301($_ptr_Parameter16; $_ptr_Parameter17; $_ptr_Parameter18; $_ptr_Parameter19; $_ptr_Parameter2; $_ptr_Parameter20; $_ptr_Parameter21; $_ptr_Parameter22; $_ptr_Parameter23; $_ptr_Parameter24; $_ptr_Parameter3)
	C_POINTER:C301($_ptr_Parameter4; $_ptr_Parameter5; $_ptr_Parameter6; $_ptr_Parameter7; $_ptr_Parameter8; $_ptr_Parameter9; $_ptr_ParameterArrayElement1; $_ptr_ParameterArrayElement10; $_ptr_ParameterArrayElement11; $_ptr_ParameterArrayElement12; $_ptr_ParameterArrayElement13)
	C_POINTER:C301($_ptr_ParameterArrayElement14; $_ptr_ParameterArrayElement15; $_ptr_ParameterArrayElement16; $_ptr_ParameterArrayElement17; $_ptr_ParameterArrayElement18; $_ptr_ParameterArrayElement19; $_ptr_ParameterArrayElement2; $_ptr_ParameterArrayElement3; $_ptr_ParameterArrayElement4; $_ptr_ParameterArrayElement5; $_ptr_ParameterArrayElement6)
	C_POINTER:C301($_ptr_ParameterArrayElement7; $_ptr_ParameterArrayElement8; $_ptr_ParameterArrayElement9; $_ptr_ReturnVariable; $2; $4; $5; $6; Mac_P_endtPtr; Mac_P_IncrPtr; Mac_P_IndexPtr)
	C_POINTER:C301(Mac_P_startPtr; MAC_ptr_FilePointer; $_ptr_3; $_ptr_6; $_ptr_DataVariable; $_ptr_FieldPointer; $_ptr_index; $_ptr_Parameter1; $_ptr_Parameter10; $_ptr_Parameter11; $_ptr_Parameter12)
	C_POINTER:C301($_ptr_Parameter13; $_ptr_Parameter14; $_ptr_Parameter15; $_ptr_Parameter16; $_ptr_Parameter17; $_ptr_Parameter18; $_ptr_Parameter19; $_ptr_Parameter2; $_ptr_Parameter3; $_ptr_Parameter4; $_ptr_Parameter5)
	C_POINTER:C301($_ptr_Parameter6; $_ptr_Parameter7; $_ptr_Parameter8; $_ptr_Parameter9; $_ptr_ParameterArrayElement1; $_ptr_ParameterArrayElement10; $_ptr_ParameterArrayElement11; $_ptr_ParameterArrayElement12; $_ptr_ParameterArrayElement13; $_ptr_ParameterArrayElement14; $_ptr_ParameterArrayElement15)
	C_POINTER:C301($_ptr_ParameterArrayElement16; $_ptr_ParameterArrayElement17; $_ptr_ParameterArrayElement18; $_ptr_ParameterArrayElement19; $_ptr_ParameterArrayElement2; $_ptr_ParameterArrayElement3; $_ptr_ParameterArrayElement4; $_ptr_ParameterArrayElement5; $_ptr_ParameterArrayElement6; $_ptr_ParameterArrayElement7; $_ptr_ParameterArrayElement8)
	C_POINTER:C301($_ptr_ParameterArrayElement9; $_ptr_ReturnVariable; $3; $6; Mac_P_endtPtr; Mac_P_IncrPtr; Mac_P_IndexPtr; Mac_P_startPtr; MAC_ptr_FilePointer)
	C_REAL:C285($_r_ThisValue; $_r_ThisValue10; $_r_ThisValue11; $_r_ThisValue12; $_r_ThisValue13; $_r_ThisValue14; $_r_ThisValue15; $_r_ThisValue16; $_r_ThisValue17; $_r_ThisValue18; $_r_ThisValue19)
	C_REAL:C285($_r_ThisValue2; $_r_ThisValue3; $_r_ThisValue4; $_r_ThisValue5; $_r_ThisValue6; $_r_ThisValue7; $_r_ThisValue8; $_r_ThisValue9; $1; $_r_ThisValue; $_r_ThisValue10)
	C_REAL:C285($_r_ThisValue11; $_r_ThisValue12; $_r_ThisValue13; $_r_ThisValue14; $_r_ThisValue15; $_r_ThisValue16; $_r_ThisValue17; $_r_ThisValue18; $_r_ThisValue19; $_r_ThisValue2; $_r_ThisValue3)
	C_REAL:C285($_r_ThisValue4; $_r_ThisValue5; $_r_ThisValue6; $_r_ThisValue7; $_r_ThisValue8; $_r_ThisValue9)
	C_TEXT:C284(<>ButtPress; $_t_CaseOfLine; $_t_Command; $_t_Conjuction; $_t_DocumentPath; $_t_EndString; $_t_Evaluate; $_t_FieldName; $_t_Increment; $_t_Index; $_t_Message)
	C_TEXT:C284($_t_MethodCalledOnError; $_t_MethodName; $_t_oldMethodName; $_t_Parameter; $_t_ParameterElement1; $_t_ParameterElement2; $_t_ParameterElement3; $_t_ParameterNoQuotes; $_t_ParameterString; $_t_ProcessCommands; $_t_ProcessIDString)
	C_TEXT:C284($_t_ProcessMemoryString; $_t_ProcessName; $_t_ProcessVariable; $_t_SqlStatement; $_t_Start; $_t_TableName; $_t_TableNamewithBrackets; $_t_ThisCharacter; $_t_ThisFieldName; $_t_ThisLine; $_t_ThisValue)
	C_TEXT:C284($_t_ThisValue10; $_t_ThisValue11; $_t_ThisValue12; $_t_ThisValue13; $_t_ThisValue14; $_t_ThisValue15; $_t_ThisValue16; $_t_ThisValue17; $_t_ThisValue18; $_t_ThisValue19; $_t_ThisValue2)
	C_TEXT:C284($_t_ThisValue3; $_t_ThisValue4; $_t_ThisValue5; $_t_ThisValue6; $_t_ThisValue7; $_t_ThisValue8; $_t_ThisValue9; $_t_Title; $_t_UniqueProcessString; $_t_VariableName; Mac_t_ExecuteLine)
	C_TEXT:C284(Mac_T_rErrorLineString; SQL_Use_Access_Rights; vMTitle3; vMTitle4; <>ButtDis; $_t_CaseOfLine; $_t_Command; $_t_Conjuction; $_t_DocumentPath; $_t_EndString; $_t_Evaluate)
	C_TEXT:C284($_t_FieldName; $_t_Increment; $_t_Index; $_t_Message; $_t_MethodCalledOnError; $_t_MethodName; $_t_oldMethodName; $_t_Parameter; $_t_ParameterElement1; $_t_ParameterElement2; $_t_ParameterElement3)
	C_TEXT:C284($_t_ParameterNoQuotes; $_t_ParameterString; $_t_ProcessCommands; $_t_ProcessIDString; $_t_ProcessMemoryString; $_t_ProcessName; $_t_ProcessVariable; $_t_SqlStatement; $_t_Start; $_t_TableName; $_t_TableNamewithBrackets)
	C_TEXT:C284($_t_ThisCharacter; $_t_ThisFieldName; $_t_ThisLine; $_t_ThisValue; $_t_ThisValue10; $_t_ThisValue11; $_t_ThisValue12; $_t_ThisValue13; $_t_ThisValue14; $_t_ThisValue15; $_t_ThisValue16)
	C_TEXT:C284($_t_ThisValue17; $_t_ThisValue18; $_t_ThisValue19; $_t_ThisValue2; $_t_ThisValue3; $_t_ThisValue4; $_t_ThisValue5; $_t_ThisValue6; $_t_ThisValue7; $_t_ThisValue8; $_t_ThisValue9)
	C_TEXT:C284($_t_Title; $_t_UniqueProcessString; $_t_VariableName; Mac_t_ExecuteLine; Mac_T_rErrorLineString)
	C_TIME:C306($_ti_DocumentRef; $_ti_ThisValue; $_ti_ThisValue10; $_ti_ThisValue11; $_ti_ThisValue12; $_ti_ThisValue13; $_ti_ThisValue14; $_ti_ThisValue15; $_ti_ThisValue16; $_ti_ThisValue17; $_ti_ThisValue18)
	C_TIME:C306($_ti_ThisValue19; $_ti_ThisValue2; $_ti_ThisValue3; $_ti_ThisValue4; $_ti_ThisValue5; $_ti_ThisValue6; $_ti_ThisValue7; $_ti_ThisValue8; $_ti_ThisValue9; $_ti_DocumentRef; $_ti_ThisValue)
	C_TIME:C306($_ti_ThisValue10; $_ti_ThisValue11; $_ti_ThisValue12; $_ti_ThisValue13; $_ti_ThisValue14; $_ti_ThisValue15; $_ti_ThisValue16; $_ti_ThisValue17; $_ti_ThisValue18; $_ti_ThisValue19; $_ti_ThisValue2)
	C_TIME:C306($_ti_ThisValue3; $_ti_ThisValue4; $_ti_ThisValue5; $_ti_ThisValue6; $_ti_ThisValue7; $_ti_ThisValue8; $_ti_ThisValue9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_Play")
//TRACE
$_t_MethodCalledOnError:=Method called on error:C704
ON ERR CALL:C155("Error_Macro")
Compiler_Variables
Compiler_Variables_Inter
$_bo_InternetServer:=((DB_GetModuleSettingByNUM(Module_IntServer))>1)

$_bo_CaseOfHandling:=False:C215
$_bo_WindowOpen:=False:C215
$_bo_IfHandling:=False:C215
$_bo_WhileHandling:=False:C215
If ($1=0)
	$_l_Right:=0
	MAC_l_MessageWindow:=0
Else 
	$_l_Right:=MAC_l_MessageWindow
End if 
$_bo_noStop:=True:C214

If (False:C215)
	MAC_PRINTED:=False:C215
	
	If (Not:C34(MAC_PRINTED))
		$_ti_DocumentRef:=Create document:C266(""; "TEXT")
		For ($_l_exIndex; 1; Size of array:C274($2->))
			$_t_ThisLine:=$2->{$_l_exIndex}{1}+Char:C90(13)
			SEND PACKET:C103($_ti_DocumentRef; $_t_ThisLine)
		End for 
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		
		MAC_PRINTED:=True:C214
		//TRACE
	End if 
	
End if 



If (Count parameters:C259>=6)
	For ($_l_Execute; 1; Size of array:C274($2->))
		
		If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
			$_t_ThisLine:=$2->{$_l_Execute}{1}
			
			Mac_T_rErrorLineString:=$_t_ThisLine
			If ($_t_ThisLine#"")
				$_ptr_3:=$3
				$_t_Command:=$_ptr_3->{$_l_Execute}
				
				Case of 
						
					: ($_t_Command="`@") | ($_t_Command="\\@")
					: ($_t_Command="*@")
						If ($_bo_InternetServer)
							IME_Reply($_t_ThisLine)
						End if 
						
					: ($_t_Command="ITX @")
						If ($_bo_InternetServer)
							IME_ITXPlay($_t_Command)
						End if 
						
					: ($_t_Command="IMA @")
						If ($_bo_InternetServer)
							
							IME_IMAPlay($_t_Command)
						End if 
						
					: ($_t_Command="Case of")
						For ($_l_CaseofIndex; $_l_Execute; Size of array:C274($2->))
							If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
								$_ptr_3:=$3
								$_t_Command:=$_ptr_3->{$_l_CaseofIndex}
								$_t_CaseOfLine:=$2->{$_l_CaseofIndex}{1}
								If ($_t_Command#"") & ($_t_CaseOfLine#"")
									Case of 
										: ($_t_Command=":")
											//Evaluate this line
											$_bo_lineIsTrue:=False:C215
											MAC_bo_LineIsTrue:=False:C215
											For ($_l_ParametersCount; 1; Size of array:C274($5->{$_l_CaseofIndex}))
												If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
													If ($5->{$_l_CaseofIndex}{$_l_ParametersCount}#"")
														$_t_Parameter:="("+$5->{$_l_CaseofIndex}{$_l_ParametersCount}+")"
														If ($_l_ParametersCount=1)
															EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
														Else 
															$_ptr_6:=$6
															$_t_Conjuction:=$_ptr_6->{$_l_CaseofIndex}{$_l_ParametersCount}
															Case of 
																: ($_t_Conjuction="&")
																	$_bo_lineIsTrue:=MAC_bo_LineIsTrue
																	EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
																	MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue & $_bo_lineIsTrue
																: ($_t_Conjuction="|")
																	$_bo_lineIsTrue:=MAC_bo_LineIsTrue
																	EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
																	MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue | $_bo_lineIsTrue
																: ($_t_Conjuction="#")
																	$_bo_lineIsTrue:=MAC_bo_LineIsTrue
																	EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
																	MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue#$_bo_lineIsTrue
																Else 
																	$_bo_lineIsTrue:=MAC_bo_LineIsTrue
																	EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
																	MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue & $_bo_lineIsTrue
															End case 
														End if 
													Else 
														$_l_ParametersCount:=Size of array:C274($5->{$_l_CaseofIndex})
														
													End if 
												Else 
													MAC_bo_LineIsTrue:=False:C215
													$_bo_noStop:=False:C215
													$_l_ParametersCount:=Size of array:C274($5->{$_l_CaseofIndex})
												End if 
											End for 
											If (MAC_bo_LineIsTrue)
												If ($_l_CaseofIndex<Size of array:C274($2->))  //just in case!!
													
													If (Size of array:C274($2->{$_l_CaseofIndex+1})>1)
														//Gather the sub macro...lines
														$_l_LastLine:=0
														For ($_l_endStatementIndex; $_l_CaseofIndex+1; Size of array:C274($2->))
															If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
																If ($2->{$_l_endStatementIndex}{1}#"")
																	$_t_EndString:=$2->{$_l_endStatementIndex}{1}
																	If ($_t_EndString=":@") | ($_t_EndString="Else@") | ($_t_EndString="End case@")
																		$_l_LastLine:=$_l_endStatementIndex-1
																		$_l_endStatementIndex:=Size of array:C274($2->)
																	End if 
																End if 
																If ($_l_LastLine>0)
																	$_l_NumberofLines:=$_l_LastLine-($_l_CaseofIndex)
																	ARRAY TEXT:C222($_at_2DTextBlocks; $_l_NumberofLines; 0)
																	ARRAY TEXT:C222($_at_Commands; $_l_NumberofLines)
																	ARRAY TEXT:C222($_at_ExternalBlocks; $_l_NumberofLines)
																	ARRAY TEXT:C222($_at_2DParameters; $_l_NumberofLines; 0)
																	ARRAY TEXT:C222($_at_Conjuctions; $_l_NumberofLines; 0)
																	$_l_Row:=1
																	$_bo_ExecuteCommand:=True:C214
																	
																	//Had a little problem here with if statements being at level 1 inside a case statement
																	
																	For ($_l_FillIndex; $_l_CaseofIndex+1; ($_l_CaseofIndex)+$_l_NumberofLines)
																		If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
																			If (Size of array:C274($2->{$_l_FillIndex})>Size of array:C274($_at_2DTextBlocks{$_l_Row}))
																				$_l_NumberofColumns:=Size of array:C274($2->{$_l_FillIndex})
																				ARRAY TEXT:C222($_at_2DTextBlocks; $_l_NumberofLines; $_l_NumberofColumns)
																			End if 
																			
																			For ($_l_Fill2Index; 2; Size of array:C274($2->{$_l_FillIndex}))
																				$_at_2DTextBlocks{$_l_Row}{$_l_Fill2Index-1}:=$2->{$_l_FillIndex}{$_l_Fill2Index}
																			End for 
																			$_at_Commands{$_l_Row}:=$3->{$_l_FillIndex}
																			$_at_ExternalBlocks{$_l_Row}:=$4->{$_l_FillIndex}
																			If (Size of array:C274($5->{$_l_FillIndex})>Size of array:C274($_at_2DParameters{$_l_Row}))
																				$_l_NumberofColumns:=Size of array:C274($5->{$_l_FillIndex})
																				ARRAY TEXT:C222($_at_2DParameters; $_l_NumberofLines; $_l_NumberofColumns)
																			End if 
																			If (Size of array:C274($6->{$_l_FillIndex})>Size of array:C274($_at_Conjuctions{$_l_Row}))
																				$_l_NumberofColumns:=Size of array:C274($6->{$_l_FillIndex})
																				ARRAY TEXT:C222($_at_Conjuctions; $_l_NumberofLines; $_l_NumberofColumns)
																			End if 
																			
																			For ($_l_Fill2Index; 1; Size of array:C274($5->{$_l_FillIndex}))
																				$_at_2DParameters{$_l_Row}{$_l_Fill2Index}:=$5->{$_l_FillIndex}{$_l_Fill2Index}
																			End for 
																			
																			For ($_l_Fill2Index; 1; Size of array:C274($6->{$_l_FillIndex}))
																				$_at_Conjuctions{$_l_Row}{$_l_Fill2Index-1}:=$6->{$_l_FillIndex}{$_l_Fill2Index}
																			End for 
																			$_l_Row:=$_l_Row+1
																			
																		Else 
																			$_bo_ExecuteCommand:=False:C215
																			$_bo_noStop:=False:C215
																			$_l_FillIndex:=($_l_CaseofIndex)+$_l_NumberofLines
																		End if 
																	End for 
																	If ($_bo_ExecuteCommand)
																		$_l_ScriptLevel:=$_l_ScriptLevel+1
																		Macro_Play($_l_ScriptLevel; ->$_at_2DTextBlocks; ->$_at_Commands; ->$_at_ExternalBlocks; ->$_at_2DParameters; ->$_at_Conjuctions)
																		If (SCPT_l_Cancel=Current process:C322)
																			$_bo_noStop:=False:C215
																		End if 
																		$_l_ScriptLevel:=$_l_ScriptLevel-1
																		//TRACE
																		$_l_Execute:=$_l_CaseofIndex
																		$_bo_EndCase:=False:C215
																		
																		Repeat 
																			$_t_EndString:=$2->{$_l_Execute}{1}
																			If ($_t_EndString="End case@")
																				$_t_Command:=$3->{$_l_Execute}
																				If ($_t_Command="END CASE") | ($_l_Execute=Size of array:C274($2->))
																					$_bo_EndCase:=True:C214
																				Else 
																					$_l_Execute:=$_l_Execute+1
																				End if 
																			Else 
																				$_l_Execute:=$_l_Execute+1
																			End if 
																		Until ($_bo_EndCase)
																		$_l_CaseofIndex:=Size of array:C274($2->)
																		
																	End if 
																	
																	
																End if 
															Else 
																$_bo_noStop:=False:C215
																$_l_endStatementIndex:=Size of array:C274($2->)
															End if 
															
														End for 
													End if 
												End if 
											End if 
										: ($_t_Command="else")
											//if we are here and we have not evaluated a case statement then this is true
											MAC_bo_LineIsTrue:=True:C214
											If ($_l_CaseofIndex<Size of array:C274($2->))  //just in case!!
												
												If (Size of array:C274($2->{$_l_CaseofIndex+1})>1)
													//Gather the sub macro...lines
													$_l_LastLine:=0
													For ($_l_endStatementIndex; $_l_CaseofIndex+1; Size of array:C274($2->))
														If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
															If ($2->{$_l_endStatementIndex}{1}#"")
																
																$_l_LastLine:=$_l_endStatementIndex-1
																$_l_endStatementIndex:=Size of array:C274($2->)
															End if 
															If ($_l_LastLine>0)
																$_l_NumberofLines:=$_l_LastLine-($_l_CaseofIndex)
																ARRAY TEXT:C222($_at_2DTextBlocks; $_l_NumberofLines; 0)
																ARRAY TEXT:C222($_at_Commands; $_l_NumberofLines)
																ARRAY TEXT:C222($_at_ExternalBlocks; $_l_NumberofLines)
																ARRAY TEXT:C222($_at_2DParameters; $_l_NumberofLines; 0)
																ARRAY TEXT:C222($_at_Conjuctions; $_l_NumberofLines; 0)
																$_l_Row:=1
																$_bo_ExecuteCommand:=True:C214
																For ($_l_FillIndex; $_l_CaseofIndex+1; ($_l_CaseofIndex)+$_l_NumberofLines)
																	If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
																		If (Size of array:C274($2->{$_l_FillIndex})>Size of array:C274($_at_2DTextBlocks{$_l_Row}))
																			$_l_NumberofColumns:=Size of array:C274($2->{$_l_FillIndex})
																			ARRAY TEXT:C222($_at_2DTextBlocks; $_l_NumberofLines; $_l_NumberofColumns)
																		End if 
																		
																		For ($_l_Fill2Index; 2; Size of array:C274($2->{$_l_FillIndex}))
																			$_at_2DTextBlocks{$_l_Row}{$_l_Fill2Index-1}:=$2->{$_l_FillIndex}{$_l_Fill2Index}
																		End for 
																		$_at_Commands{$_l_Row}:=$3->{$_l_FillIndex}
																		$_at_ExternalBlocks{$_l_Row}:=$4->{$_l_FillIndex}
																		If (Size of array:C274($5->{$_l_FillIndex})>Size of array:C274($_at_2DParameters{$_l_Row}))
																			$_l_NumberofColumns:=Size of array:C274($5->{$_l_FillIndex})
																			ARRAY TEXT:C222($_at_2DParameters; $_l_NumberofLines; $_l_NumberofColumns)
																		End if 
																		If (Size of array:C274($6->{$_l_FillIndex})>Size of array:C274($_at_Conjuctions{$_l_Row}))
																			$_l_NumberofColumns:=Size of array:C274($6->{$_l_FillIndex})
																			ARRAY TEXT:C222($_at_Conjuctions; $_l_NumberofLines; $_l_NumberofColumns)
																		End if 
																		
																		For ($_l_Fill2Index; 1; Size of array:C274($5->{$_l_FillIndex}))
																			$_at_2DParameters{$_l_Row}{$_l_Fill2Index}:=$5->{$_l_FillIndex}{$_l_Fill2Index}
																		End for 
																		For ($_l_Fill2Index; 1; Size of array:C274($6->{$_l_FillIndex}))
																			$_at_Conjuctions{$_l_Row}{$_l_Fill2Index-1}:=$6->{$_l_FillIndex}{$_l_Fill2Index}
																		End for 
																		$_l_Row:=$_l_Row+1
																		
																	Else 
																		$_bo_ExecuteCommand:=False:C215
																		$_bo_noStop:=False:C215
																		$_l_FillIndex:=($_l_CaseofIndex)+$_l_NumberofLines
																	End if 
																End for 
																If ($_bo_ExecuteCommand)
																	$_l_ScriptLevel:=$_l_ScriptLevel+1
																	Macro_Play($_l_ScriptLevel; ->$_at_2DTextBlocks; ->$_at_Commands; ->$_at_ExternalBlocks; ->$_at_2DParameters; ->$_at_Conjuctions)
																	If (SCPT_l_Cancel=Current process:C322)
																		$_bo_noStop:=False:C215
																	End if 
																	$_l_ScriptLevel:=$_l_ScriptLevel-1
																	
																	$_l_Execute:=$_l_CaseofIndex
																	$_bo_EndCase:=False:C215
																	
																	Repeat 
																		$_t_EndString:=$2->{$_l_Execute}{1}
																		If ($_t_EndString="End case@")
																			$_t_Command:=$3->{$_l_Execute}
																			If ($_t_Command="END CASE") | ($_l_Execute=Size of array:C274($2->))
																				$_bo_EndCase:=True:C214
																			Else 
																				$_l_Execute:=$_l_Execute+1
																			End if 
																		Else 
																			$_l_Execute:=$_l_Execute+1
																		End if 
																		
																	Until ($_bo_EndCase)
																	$_l_CaseofIndex:=Size of array:C274($2->)
																End if 
																
															End if 
														Else 
															$_bo_noStop:=False:C215
															$_l_endStatementIndex:=Size of array:C274($2->)
														End if 
														
													End for 
												End if 
											End if 
											
										: ($_t_Command="End Case")
											$_l_Execute:=$_l_CaseofIndex
											$_l_CaseofIndex:=Size of array:C274($2->)
										Else 
											//there will be no other commands we are int
									End case 
								End if 
							Else 
								$_bo_noStop:=False:C215
								$_l_CaseofIndex:=Size of array:C274($2->)
							End if 
							
						End for 
						
						
						
					: ($_t_Command="End case")
						
					: ($_t_Command="If")  //²
						
						//`````
						//`
						$_bo_lineIsTrue:=False:C215
						MAC_bo_LineIsTrue:=False:C215
						For ($_l_ParametersCount; 1; Size of array:C274($5->{$_l_Execute}))
							If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
								If ($5->{$_l_Execute}{$_l_ParametersCount}#"")
									$_t_Parameter:="("+$5->{$_l_Execute}{$_l_ParametersCount}+")"
									If ($_l_ParametersCount=1)
										EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
									Else 
										$_t_Conjuction:=$6->{$_l_Execute}{$_l_ParametersCount}
										Case of 
											: ($_t_Conjuction="&")
												$_bo_lineIsTrue:=MAC_bo_LineIsTrue
												EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
												MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue & $_bo_lineIsTrue
											: ($_t_Conjuction="|")
												$_bo_lineIsTrue:=MAC_bo_LineIsTrue
												EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
												MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue | $_bo_lineIsTrue
											: ($_t_Conjuction="#")
												$_bo_lineIsTrue:=MAC_bo_LineIsTrue
												EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
												MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue#$_bo_lineIsTrue
											Else 
												$_bo_lineIsTrue:=MAC_bo_LineIsTrue
												EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
												MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue & $_bo_lineIsTrue
										End case 
									End if 
								Else 
									$_l_ParametersCount:=Size of array:C274($5->{$_l_Execute})
									
								End if 
							Else 
								MAC_bo_LineIsTrue:=False:C215
								$_bo_noStop:=False:C215
								$_l_ParametersCount:=Size of array:C274($5->{$_l_Execute})
								
							End if 
						End for 
						If (MAC_bo_LineIsTrue)
							If ($_l_Execute<Size of array:C274($2->))  //just in case!!
								
								If (Size of array:C274($2->{$_l_Execute+1})>1)
									//Gather the sub macro...lines
									$_l_LastLine:=0
									For ($_l_endStatementIndex; $_l_Execute+1; Size of array:C274($2->))
										If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
											If ($2->{$_l_endStatementIndex}{1}="End if@") | ($2->{$_l_endStatementIndex}{1}="Else@")
												$_l_LastLine:=$_l_endStatementIndex-1
												$_l_endStatementIndex:=Size of array:C274($2->)
											End if 
											If ($_l_LastLine>0)
												$_l_NumberofLines:=$_l_LastLine-($_l_Execute)
												ARRAY TEXT:C222($_at_2DTextBlocks; $_l_NumberofLines; 0)
												ARRAY TEXT:C222($_at_Commands; $_l_NumberofLines)
												ARRAY TEXT:C222($_at_ExternalBlocks; $_l_NumberofLines)
												ARRAY TEXT:C222($_at_2DParameters; $_l_NumberofLines; 0)
												ARRAY TEXT:C222($_at_Conjuctions; $_l_NumberofLines; 0)
												$_l_Row:=1
												$_bo_ExecuteCommand:=True:C214
												For ($_l_FillIndex; $_l_Execute+1; ($_l_Execute)+$_l_NumberofLines)
													If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
														If (Size of array:C274($2->{$_l_FillIndex})>Size of array:C274($_at_2DTextBlocks{$_l_Row}))
															$_l_NumberofColumns:=Size of array:C274($2->{$_l_FillIndex})
															ARRAY TEXT:C222($_at_2DTextBlocks; $_l_NumberofLines; $_l_NumberofColumns)
														End if 
														
														For ($_l_Fill2Index; 2; Size of array:C274($2->{$_l_FillIndex}))
															$_at_2DTextBlocks{$_l_Row}{$_l_Fill2Index-1}:=$2->{$_l_FillIndex}{$_l_Fill2Index}
														End for 
														$_at_Commands{$_l_Row}:=$3->{$_l_FillIndex}
														$_at_ExternalBlocks{$_l_Row}:=$4->{$_l_FillIndex}
														If (Size of array:C274($5->{$_l_FillIndex})>Size of array:C274($_at_2DParameters{$_l_Row}))
															$_l_NumberofColumns:=Size of array:C274($5->{$_l_FillIndex})
															ARRAY TEXT:C222($_at_2DParameters; $_l_NumberofLines; $_l_NumberofColumns)
														End if 
														If (Size of array:C274($6->{$_l_FillIndex})>Size of array:C274($_at_Conjuctions{$_l_Row}))
															$_l_NumberofColumns:=Size of array:C274($6->{$_l_FillIndex})
															ARRAY TEXT:C222($_at_Conjuctions; $_l_NumberofLines; $_l_NumberofColumns)
														End if 
														
														For ($_l_Fill2Index; 1; Size of array:C274($5->{$_l_FillIndex}))
															$_at_2DParameters{$_l_Row}{$_l_Fill2Index}:=$5->{$_l_FillIndex}{$_l_Fill2Index}
														End for 
														For ($_l_Fill2Index; 1; Size of array:C274($6->{$_l_FillIndex}))
															$_at_Conjuctions{$_l_Row}{$_l_Fill2Index-1}:=$6->{$_l_FillIndex}{$_l_Fill2Index}
														End for 
														$_l_Row:=$_l_Row+1
													Else 
														$_bo_ExecuteCommand:=False:C215
														$_bo_noStop:=False:C215
														$_l_FillIndex:=Size of array:C274($5->{$_l_Execute})
													End if 
												End for 
												If ($_bo_ExecuteCommand)
													$_l_ScriptLevel:=$_l_ScriptLevel+1
													Macro_Play($_l_ScriptLevel; ->$_at_2DTextBlocks; ->$_at_Commands; ->$_at_ExternalBlocks; ->$_at_2DParameters; ->$_at_Conjuctions)
													If (SCPT_l_Cancel=Current process:C322)
														$_bo_noStop:=False:C215
													End if 
													$_l_ScriptLevel:=$_l_ScriptLevel-1
													$_l_Execute:=$_l_LastLine+1  //$_l_LastLine is the last line we executed-the next line is the end if
													
													For ($_l_endStatementIndex; $_l_Execute; Size of array:C274($2->))
														If ($2->{$_l_endStatementIndex}{1}="end if@")
															$_l_LastLine:=$_l_endStatementIndex
															$_l_endStatementIndex:=Size of array:C274($2->)
														End if 
													End for 
													//TRACE
													$_l_Execute:=$_l_LastLine
												Else 
													$_l_LastLine:=Size of array:C274($2->)
													//TRACE
													$_l_Execute:=$_l_LastLine-1
												End if 
												
											End if 
										Else 
											$_bo_noStop:=False:C215
											$_l_endStatementIndex:=Size of array:C274($2->)
											
											
										End if 
									End for 
								End if 
							End if 
						Else   //look for the else or end if
							
							$_bo_ExecuteElse:=False:C215
							If ($_l_Execute<Size of array:C274($2->))  //just in case!!
								
								For ($_l_endStatementIndex; $_l_Execute+1; Size of array:C274($2->))
									If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
										If ($2->{$_l_endStatementIndex}{1}#"")
											Case of 
												: ($2->{$_l_endStatementIndex}{1}="Else")
													$_l_Execute:=$_l_endStatementIndex  //this is the beginning not the end
													
													$_bo_ExecuteElse:=True:C214
													$_l_LastLine:=$_l_endStatementIndex-1
													$_l_endStatementIndex:=Size of array:C274($2->)
													
												Else 
													$_l_Execute:=$_l_endStatementIndex  //This is the end
													
													$_bo_ExecuteElse:=False:C215
													$_l_LastLine:=$_l_endStatementIndex-1
													$_l_endStatementIndex:=Size of array:C274($2->)
											End case 
											
										End if 
									Else 
										$_bo_noStop:=False:C215
										$_l_endStatementIndex:=Size of array:C274($2->)
									End if 
								End for 
							End if 
							If ($_bo_ExecuteElse)
								If ($_l_Execute<Size of array:C274($2->))  //just in case!!
									
									If (Size of array:C274($2->{$_l_Execute+1})>1)
										//Gather the sub macro...lines
										$_l_LastLine:=0
										For ($_l_endStatementIndex; $_l_Execute+1; Size of array:C274($2->))
											If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
												If ($2->{$_l_endStatementIndex}{1}#"")
													$_l_LastLine:=$_l_endStatementIndex-1
													$_l_endStatementIndex:=Size of array:C274($2->)
												End if 
												If ($_l_LastLine>0)
													$_l_NumberofLines:=$_l_LastLine-($_l_Execute)
													ARRAY TEXT:C222($_at_2DTextBlocks; $_l_NumberofLines; 0)
													ARRAY TEXT:C222($_at_Commands; $_l_NumberofLines)
													ARRAY TEXT:C222($_at_ExternalBlocks; $_l_NumberofLines)
													ARRAY TEXT:C222($_at_2DParameters; $_l_NumberofLines; 0)
													ARRAY TEXT:C222($_at_Conjuctions; $_l_NumberofLines; 0)
													$_l_Row:=1
													$_bo_ExecuteCommand:=True:C214
													For ($_l_FillIndex; $_l_Execute+1; ($_l_Execute)+$_l_NumberofLines)
														If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
															If (Size of array:C274($2->{$_l_FillIndex})>Size of array:C274($_at_2DTextBlocks{$_l_Row}))
																$_l_NumberofColumns:=Size of array:C274($2->{$_l_FillIndex})
																ARRAY TEXT:C222($_at_2DTextBlocks; $_l_NumberofLines; $_l_NumberofColumns)
															End if 
															For ($_l_Fill2Index; 2; Size of array:C274($2->{$_l_FillIndex}))
																$_at_2DTextBlocks{$_l_Row}{$_l_Fill2Index-1}:=$2->{$_l_FillIndex}{$_l_Fill2Index}
															End for 
															$_at_Commands{$_l_Row}:=$3->{$_l_FillIndex}
															$_at_ExternalBlocks{$_l_Row}:=$4->{$_l_FillIndex}
															If (Size of array:C274($5->{$_l_FillIndex})>Size of array:C274($_at_2DParameters{$_l_Row}))
																$_l_NumberofColumns:=Size of array:C274($5->{$_l_FillIndex})
																ARRAY TEXT:C222($_at_2DParameters; $_l_NumberofLines; $_l_NumberofColumns)
															End if 
															If (Size of array:C274($6->{$_l_FillIndex})>Size of array:C274($_at_Conjuctions{$_l_Row}))
																$_l_NumberofColumns:=Size of array:C274($6->{$_l_FillIndex})
																ARRAY TEXT:C222($_at_Conjuctions; $_l_NumberofLines; $_l_NumberofColumns)
															End if 
															For ($_l_Fill2Index; 1; Size of array:C274($5->{$_l_FillIndex}))
																$_at_2DParameters{$_l_Row}{$_l_Fill2Index}:=$5->{$_l_FillIndex}{$_l_Fill2Index}
															End for 
															For ($_l_Fill2Index; 1; Size of array:C274($6->{$_l_FillIndex}))
																$_at_Conjuctions{$_l_Row}{$_l_Fill2Index-1}:=$6->{$_l_FillIndex}{$_l_Fill2Index}
															End for 
															$_l_Row:=$_l_Row+1
														Else 
															$_bo_ExecuteCommand:=True:C214
															$_bo_noStop:=False:C215
															$_l_FillIndex:=($_l_Execute)+$_l_NumberofLines
														End if 
														
														
													End for 
													If ($_bo_ExecuteCommand)
														$_l_ScriptLevel:=$_l_ScriptLevel+1
														Macro_Play($_l_ScriptLevel; ->$_at_2DTextBlocks; ->$_at_Commands; ->$_at_ExternalBlocks; ->$_at_2DParameters; ->$_at_Conjuctions)
														If (SCPT_l_Cancel=Current process:C322)
															$_bo_noStop:=False:C215
														End if 
														$_l_ScriptLevel:=$_l_ScriptLevel-1
														$_l_Execute:=$_l_LastLine+1
														For ($_l_endStatementIndex; $_l_Execute; Size of array:C274($2->))
															If ($2->{$_l_endStatementIndex}{1}#"")
																$_l_LastLine:=$_l_endStatementIndex
																$_l_endStatementIndex:=Size of array:C274($2->)
															End if 
														End for 
														//TRACE
														$_l_Execute:=$_l_LastLine
													Else 
														$_l_Execute:=$_l_LastLine
														For ($_l_endStatementIndex; $_l_Execute; Size of array:C274($2->))
															If ($2->{$_l_endStatementIndex}{1}#"")
																$_l_LastLine:=$_l_endStatementIndex
																$_l_endStatementIndex:=Size of array:C274($2->)
															End if 
														End for 
														
													End if 
													
												End if 
											Else 
												$_bo_noStop:=False:C215
												$_l_endStatementIndex:=Size of array:C274($2->)
											End if 
											
										End for 
									End if 
								End if 
							End if 
						End if 
						
						//````
						
						
						
					: ($_t_Command="Else")
						//Widowed
						
					: ($_t_Command="End If")
						//Widowed
						
					: ($_t_Command="While")
						//so here we handle things slightly differently.
						//this is a loop.
						//we find the end while and gather the lines
						//plus we have the evaluate statement
						//we then run a while loop testing the statement and calling a submacro if its true.
						//```````````
						$_bo_WhileStatement:=False:C215
						If ($_l_Execute<Size of array:C274($2->))  //just in case!!
							
							If (Size of array:C274($2->{$_l_Execute+1})>1)
								//Gather the sub macro...lines
								$_l_LastLine:=0
								For ($_l_endStatementIndex; $_l_Execute+1; Size of array:C274($2->))
									If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
										If ($2->{$_l_endStatementIndex}{1}#"")
											$_l_LastLine:=$_l_endStatementIndex-1
											$_l_endStatementIndex:=Size of array:C274($2->)
										End if 
										If ($_l_LastLine>0)
											$_l_NumberofLines:=$_l_LastLine-($_l_Execute)
											ARRAY TEXT:C222($_at_2DTextBlocks; $_l_NumberofLines; 0)
											ARRAY TEXT:C222($_at_Commands; $_l_NumberofLines)
											ARRAY TEXT:C222($_at_ExternalBlocks; $_l_NumberofLines)
											ARRAY TEXT:C222($_at_2DParameters; $_l_NumberofLines; 0)
											ARRAY TEXT:C222($_at_Conjuctions; $_l_NumberofLines; 0)
											$_l_Row:=1
											For ($_l_FillIndex; $_l_Execute+1; ($_l_Execute)+$_l_NumberofLines)
												If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
													If (Size of array:C274($2->{$_l_FillIndex})>Size of array:C274($_at_2DTextBlocks{$_l_Row}))
														$_l_NumberofColumns:=Size of array:C274($2->{$_l_FillIndex})
														ARRAY TEXT:C222($_at_2DTextBlocks; $_l_NumberofLines; $_l_NumberofColumns)
													End if 
													For ($_l_Fill2Index; 2; Size of array:C274($2->{$_l_FillIndex}))
														$_at_2DTextBlocks{$_l_Row}{$_l_Fill2Index-1}:=$2->{$_l_FillIndex}{$_l_Fill2Index}
													End for 
													$_at_Commands{$_l_Row}:=$3->{$_l_FillIndex}
													$_at_ExternalBlocks{$_l_Row}:=$4->{$_l_FillIndex}
													If (Size of array:C274($5->{$_l_FillIndex})>Size of array:C274($_at_2DParameters{$_l_Row}))
														$_l_NumberofColumns:=Size of array:C274($5->{$_l_FillIndex})
														ARRAY TEXT:C222($_at_2DParameters; $_l_NumberofLines; $_l_NumberofColumns)
													End if 
													If (Size of array:C274($6->{$_l_FillIndex})>Size of array:C274($_at_Conjuctions{$_l_Row}))
														$_l_NumberofColumns:=Size of array:C274($6->{$_l_FillIndex})
														ARRAY TEXT:C222($_at_Conjuctions; $_l_NumberofLines; $_l_NumberofColumns)
													End if 
													For ($_l_Fill2Index; 1; Size of array:C274($5->{$_l_FillIndex}))
														$_at_2DParameters{$_l_Row}{$_l_Fill2Index}:=$5->{$_l_FillIndex}{$_l_Fill2Index}
													End for 
													For ($_l_Fill2Index; 1; Size of array:C274($6->{$_l_FillIndex}))
														$_at_Conjuctions{$_l_Row}{$_l_Fill2Index}:=$6->{$_l_FillIndex}{$_l_Fill2Index}
													End for 
													$_bo_WhileStatement:=True:C214
													$_l_Row:=$_l_Row+1
												Else 
													$_bo_WhileStatement:=False:C215
													$_bo_noStop:=False:C215
													$_l_FillIndex:=($_l_Execute)+$_l_NumberofLines
												End if 
												
											End for 
											$_l_WhileLine:=$_l_Execute
											$_l_Execute:=$_l_LastLine+1
											For ($_l_endStatementIndex; $_l_Execute; Size of array:C274($2->))
												If ($2->{$_l_endStatementIndex}{1}#"")
													$_l_LastLine:=$_l_endStatementIndex
													$_l_endStatementIndex:=Size of array:C274($2->)
												End if 
											End for 
											$_l_Execute:=$_l_LastLine
										End if 
									Else 
										$_bo_noStop:=False:C215
										$_l_endStatementIndex:=Size of array:C274($2->)
									End if 
									
								End for 
							End if 
						End if 
						If ($_bo_WhileStatement)  //There is something to while....
							
							$_bo_lineIsTrue:=False:C215
							MAC_bo_LineIsTrue:=False:C215
							For ($_l_ParametersCount; 1; Size of array:C274($5->{$_l_WhileLine}))
								If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
									If ($5->{$_l_WhileLine}{$_l_ParametersCount}#"")
										$_t_Parameter:="("+$5->{$_l_WhileLine}{$_l_ParametersCount}+")"
										If ($_l_ParametersCount=1)
											EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
										Else 
											$_t_Conjuction:=$6->{$_l_WhileLine}{$_l_ParametersCount}
											Case of 
												: ($_t_Conjuction="&")
													$_bo_lineIsTrue:=MAC_bo_LineIsTrue
													EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
													MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue & $_bo_lineIsTrue
												: ($_t_Conjuction="|")
													$_bo_lineIsTrue:=MAC_bo_LineIsTrue
													EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
													MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue | $_bo_lineIsTrue
												: ($_t_Conjuction="#")
													$_bo_lineIsTrue:=MAC_bo_LineIsTrue
													EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
													MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue#$_bo_lineIsTrue
												Else 
													$_bo_lineIsTrue:=MAC_bo_LineIsTrue
													EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
													MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue & $_bo_lineIsTrue
											End case 
										End if 
									Else 
										$_l_ParametersCount:=Size of array:C274($5->{$_l_WhileLine})
										
									End if 
								Else 
									MAC_bo_LineIsTrue:=False:C215
									$_bo_noStop:=False:C215
									$_l_ParametersCount:=Size of array:C274($5->{$_l_WhileLine})
								End if 
								
							End for 
							While (MAC_bo_LineIsTrue)
								$_l_ScriptLevel:=$_l_ScriptLevel+1
								Macro_Play($_l_ScriptLevel; ->$_at_2DTextBlocks; ->$_at_Commands; ->$_at_ExternalBlocks; ->$_at_2DParameters; ->$_at_Conjuctions)
								If (SCPT_l_Cancel=Current process:C322)
									$_bo_noStop:=False:C215
								End if 
								$_l_ScriptLevel:=$_l_ScriptLevel-1
								//`re-evelaute the while test
								$_bo_lineIsTrue:=False:C215
								MAC_bo_LineIsTrue:=False:C215
								For ($_l_ParametersCount; 1; Size of array:C274($5->{$_l_WhileLine}))
									If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
										If ($5->{$_l_WhileLine}{$_l_ParametersCount}#"")
											$_t_Parameter:="("+$5->{$_l_WhileLine}{$_l_ParametersCount}+")"
											If ($_l_ParametersCount=1)
												EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
											Else 
												$_t_Conjuction:=$6->{$_l_Execute}{$_l_ParametersCount}
												Case of 
													: ($_t_Conjuction="&")
														$_bo_lineIsTrue:=MAC_bo_LineIsTrue
														EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
														MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue & $_bo_lineIsTrue
													: ($_t_Conjuction="|")
														$_bo_lineIsTrue:=MAC_bo_LineIsTrue
														EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
														MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue | $_bo_lineIsTrue
													: ($_t_Conjuction="#")
														$_bo_lineIsTrue:=MAC_bo_LineIsTrue
														EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
														MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue#$_bo_lineIsTrue
													Else 
														$_bo_lineIsTrue:=MAC_bo_LineIsTrue
														EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
														MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue & $_bo_lineIsTrue
												End case 
											End if 
										Else 
											$_l_ParametersCount:=Size of array:C274($5->{$_l_WhileLine})
											
										End if 
									Else 
										$_bo_noStop:=False:C215
										$_l_ParametersCount:=Size of array:C274($5->{$_l_WhileLine})
									End if 
								End for 
								//```````
							End while 
						End if 
						//````````````````
						
						
						
						
						
						
						
					: ($_t_Command="End while")
						//Widow
					: ($_t_Command="For")  //tested mi;1;10 mi;10;1
						
						$_t_Parameter:=""
						If (Size of array:C274($5->{$_l_Execute})>0)
							
							If ($5->{$_l_Execute}{1}#"")
								If (($5->{$_l_Execute}{1})[[1]]#"(")
									$_t_Parameter:="("+$5->{$_l_Execute}{1}+")"
								Else 
									$_t_Parameter:=$5->{$_l_Execute}{1}
								End if 
							End if 
						End if 
						//the for loop info is in the First_Parameter
						$_t_Index:=First_Param($_t_Parameter; ->$_t_Parameter)
						$_t_Start:=First_Param($_t_Parameter; ->$_t_Parameter)
						$_t_EndString:=First_Param($_t_Parameter; ->$_t_Parameter)
						$_t_Increment:=First_Param($_t_Parameter; ->$_t_Parameter)
						//now gather the for statement lines
						
						If (($_t_Index#"") & ($_t_Start#"") & ($_t_EndString#""))
							//````````
							$_bo_ForStatement:=False:C215
							If ($_l_Execute<Size of array:C274($2->))  //just in case!!
								
								If (Size of array:C274($2->{$_l_Execute+1})>1)
									//Gather the sub macro...lines
									$_l_LastLine:=0
									For ($_l_endStatementIndex; $_l_Execute+1; Size of array:C274($2->))
										If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
											If ($2->{$_l_endStatementIndex}{1}#"")
												$_l_LastLine:=$_l_endStatementIndex-1
												$_l_endStatementIndex:=Size of array:C274($2->)
											End if 
											If ($_l_LastLine>0)
												$_l_NumberofLines:=$_l_LastLine-($_l_Execute)
												ARRAY TEXT:C222($_at_2DTextBlocks; $_l_NumberofLines; 0)
												ARRAY TEXT:C222($_at_Commands; $_l_NumberofLines)
												ARRAY TEXT:C222($_at_ExternalBlocks; $_l_NumberofLines)
												ARRAY TEXT:C222($_at_2DParameters; $_l_NumberofLines; 0)
												ARRAY TEXT:C222($_at_Conjuctions; $_l_NumberofLines; 0)
												$_l_Row:=1
												For ($_l_FillIndex; $_l_Execute+1; ($_l_Execute)+$_l_NumberofLines)
													If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
														If (Size of array:C274($2->{$_l_FillIndex})>Size of array:C274($_at_2DTextBlocks{$_l_Row}))
															$_l_NumberofColumns:=Size of array:C274($2->{$_l_FillIndex})
															ARRAY TEXT:C222($_at_2DTextBlocks; $_l_NumberofLines; $_l_NumberofColumns)
														End if 
														For ($_l_Fill2Index; 2; Size of array:C274($2->{$_l_FillIndex}))
															$_at_2DTextBlocks{$_l_Row}{$_l_Fill2Index-1}:=$2->{$_l_FillIndex}{$_l_Fill2Index}
														End for 
														$_at_Commands{$_l_Row}:=$3->{$_l_FillIndex}
														$_at_ExternalBlocks{$_l_Row}:=$4->{$_l_FillIndex}
														If (Size of array:C274($5->{$_l_FillIndex})>Size of array:C274($_at_2DParameters{$_l_Row}))
															$_l_NumberofColumns:=Size of array:C274($5->{$_l_FillIndex})
															ARRAY TEXT:C222($_at_2DParameters; $_l_NumberofLines; $_l_NumberofColumns)
														End if 
														If (Size of array:C274($6->{$_l_FillIndex})>Size of array:C274($_at_Conjuctions{$_l_Row}))
															$_l_NumberofColumns:=Size of array:C274($6->{$_l_FillIndex})
															ARRAY TEXT:C222($_at_Conjuctions; $_l_NumberofLines; $_l_NumberofColumns)
														End if 
														For ($_l_Fill2Index; 1; Size of array:C274($5->{$_l_FillIndex}))
															$_at_2DParameters{$_l_Row}{$_l_Fill2Index}:=$5->{$_l_FillIndex}{$_l_Fill2Index}
														End for 
														For ($_l_Fill2Index; 1; Size of array:C274($6->{$_l_FillIndex}))
															$_at_Conjuctions{$_l_Row}{$_l_Fill2Index-1}:=$6->{$_l_FillIndex}{$_l_Fill2Index}
														End for 
														$_bo_ForStatement:=True:C214
														$_l_Row:=$_l_Row+1
													Else 
														$_bo_ForStatement:=False:C215
														$_bo_noStop:=False:C215
														$_l_FillIndex:=($_l_Execute)+$_l_NumberofLines
													End if 
													
												End for 
												$_l_Execute:=$_l_LastLine+1
											End if 
										Else 
											$_bo_ForStatement:=False:C215
											
											$_bo_noStop:=False:C215
											$_l_endStatementIndex:=Size of array:C274($2->)
											
										End if 
									End for 
								End if 
							End if 
							//```````````
							If ($_bo_ForStatement)
								Mac_P_IndexPtr:=Get pointer:C304("MAC_l_Index"+String:C10($_l_ScriptLevel))
								Mac_P_startPtr:=Get pointer:C304("MAC_l_start"+String:C10($_l_ScriptLevel))
								Mac_P_endtPtr:=Get pointer:C304("MAC_l_end"+String:C10($_l_ScriptLevel))
								Mac_P_IncrPtr:=Get pointer:C304("MAC_l_Increment"+String:C10($_l_ScriptLevel))
								MAC_l_Index:=0
								MAC_l_start:=0
								MAC_l_end:=0
								MAC_l_Increment:=1
								Mac_P_IndexPtr->:=0
								Mac_P_startPtr->:=0
								Mac_P_endtPtr->:=0
								Mac_P_IncrPtr->:=1
								$_ptr_index:=Get pointer:C304($_t_Index)
								
								
								EXECUTE FORMULA:C63("MAC_l_end:="+$_t_EndString)
								EXECUTE FORMULA:C63($_t_Index+":="+$_t_Start)
								EXECUTE FORMULA:C63("MAC_l_Index:="+$_t_Index)
								EXECUTE FORMULA:C63("MAC_l_Start:="+$_t_Start)
								$_ptr_index:=Get pointer:C304($_t_Index)
								If ($_t_Increment#"")
									EXECUTE FORMULA:C63("MAC_l_Increment:="+$_t_Increment)
								End if 
								If (MAC_l_Start>MAC_l_end)
									If (MAC_l_Increment>0)
										MAC_l_Increment:=-(MAC_l_Increment)
									End if 
								End if 
								
								Mac_P_IndexPtr->:=MAC_l_Index
								Mac_P_startPtr->:=MAC_l_start
								Mac_P_endtPtr->:=MAC_l_end
								Mac_P_IncrPtr->:=MAC_l_Increment
								$_l_Index2:=Mac_P_IndexPtr->
								$_l_Start2:=Mac_P_IndexPtr->
								$_l_End2:=Mac_P_endtPtr->
								$_l_Increment2:=Mac_P_IncrPtr->
								If ($_l_End2<$_l_Start2)
									If ($_l_Increment2>0)
										$_l_Start2:=$_l_End2
									End if 
								End if 
								If ($_l_End2>$_l_Start2)
									If ($_l_Increment2<0)
										$_l_Start2:=$_l_End2
									End if 
								End if 
								If ($_l_End2>0) & ($_l_Start2>0)
									$_bo_NoStart:=False:C215
									If ($_l_Increment2<0)
										If ($_l_Start2<$_l_End2)  // | ($_l_Start2<$_l_Index2)
											
											//we are starting before the end or ending after the start
											$_bo_NoStart:=True:C214
										End if 
									End if 
									If ($_l_Increment2>0)
										If ($_l_Index2>$_l_Start2) | ($_l_Index2>$_l_End2)
											//we are starting after the finish or starting after the start!
											$_bo_NoStart:=True:C214
										End if 
									End if 
									If (Not:C34($_bo_NoStart))
										For ($_l_Index2; $_l_Start2; $_l_End2; $_l_Increment2)
											If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
												Mac_P_IndexPtr->:=$_l_Index2
												$_ptr_index->:=Mac_P_IndexPtr->
												$_l_ScriptLevel:=$_l_ScriptLevel+1
												Macro_Play($_l_ScriptLevel; ->$_at_2DTextBlocks; ->$_at_Commands; ->$_at_ExternalBlocks; ->$_at_2DParameters; ->$_at_Conjuctions)
												If (SCPT_l_Cancel=Current process:C322)
													$_bo_noStop:=False:C215
												End if 
												$_l_ScriptLevel:=$_l_ScriptLevel-1
												Mac_P_IndexPtr->:=$_ptr_index->
												$_l_Index2:=Mac_P_IndexPtr->
											Else 
												$_bo_noStop:=False:C215
												$_l_Index2:=$_l_End2
											End if 
											
										End for 
									End if 
								End if 
							End if 
						End if 
						
						
					: ($_t_Command="ForCont")
						//will not exist-was an injection to handle the for loop
						
					: ($_t_Command="End for")
						//widow
						
					: ($_t_Command="Repeat")
						
						//so here we handle things slightly differently.
						//this is a loop.
						//we find the end while and gather the lines
						//plus we have the evaluate statement
						//we then run a while loop testing the statement and calling a submacro if its true.
						//```````````
						$_bo_RepeatStatement:=False:C215
						If ($_l_Execute<Size of array:C274($2->))  //just in case!!
							
							If (Size of array:C274($2->{$_l_Execute+1})>1)
								//Gather the sub macro...lines
								$_l_LastLine:=0
								For ($_l_endStatementIndex; $_l_Execute+1; Size of array:C274($2->))
									If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
										If ($2->{$_l_endStatementIndex}{1}#"")
											$_l_LastLine:=$_l_endStatementIndex-1
											$_l_endStatementIndex:=Size of array:C274($2->)
										End if 
										If ($_l_LastLine>0)
											$_l_NumberofLines:=$_l_LastLine-($_l_Execute)
											ARRAY TEXT:C222($_at_2DTextBlocks; $_l_NumberofLines; 0)
											ARRAY TEXT:C222($_at_Commands; $_l_NumberofLines)
											ARRAY TEXT:C222($_at_ExternalBlocks; $_l_NumberofLines)
											ARRAY TEXT:C222($_at_2DParameters; $_l_NumberofLines; 0)
											ARRAY TEXT:C222($_at_Conjuctions; $_l_NumberofLines; 0)
											$_l_Row:=1
											For ($_l_FillIndex; $_l_Execute+1; ($_l_Execute)+$_l_NumberofLines)
												If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
													If (Size of array:C274($2->{$_l_FillIndex})>Size of array:C274($_at_2DTextBlocks{$_l_Row}))
														$_l_NumberofColumns:=Size of array:C274($2->{$_l_FillIndex})
														ARRAY TEXT:C222($_at_2DTextBlocks; $_l_NumberofLines; $_l_NumberofColumns)
													End if 
													For ($_l_Fill2Index; 2; Size of array:C274($2->{$_l_FillIndex}))
														$_at_2DTextBlocks{$_l_Row}{$_l_Fill2Index-1}:=$2->{$_l_FillIndex}{$_l_Fill2Index}
													End for 
													$_at_Commands{$_l_Row}:=$3->{$_l_FillIndex}
													$_at_ExternalBlocks{$_l_Row}:=$4->{$_l_FillIndex}
													If (Size of array:C274($5->{$_l_FillIndex})>Size of array:C274($_at_2DParameters{$_l_Row}))
														$_l_NumberofColumns:=Size of array:C274($5->{$_l_FillIndex})
														ARRAY TEXT:C222($_at_2DParameters; $_l_NumberofLines; $_l_NumberofColumns)
													End if 
													If (Size of array:C274($6->{$_l_FillIndex})>Size of array:C274($_at_Conjuctions{$_l_Row}))
														$_l_NumberofColumns:=Size of array:C274($6->{$_l_FillIndex})
														ARRAY TEXT:C222($_at_Conjuctions; $_l_NumberofLines; $_l_NumberofColumns)
													End if 
													For ($_l_Fill2Index; 1; Size of array:C274($5->{$_l_FillIndex}))
														$_at_2DParameters{$_l_Row}{$_l_Fill2Index}:=$5->{$_l_FillIndex}{$_l_Fill2Index}
													End for 
													For ($_l_Fill2Index; 1; Size of array:C274($6->{$_l_FillIndex}))
														$_at_Conjuctions{$_l_Row}{$_l_Fill2Index}:=$6->{$_l_FillIndex}{$_l_Fill2Index}
													End for 
													$_l_Row:=$_l_Row+1
													$_bo_RepeatStatement:=True:C214
												Else 
													$_bo_RepeatStatement:=False:C215
													$_bo_noStop:=False:C215
													$_l_FillIndex:=($_l_Execute)+$_l_NumberofLines
												End if 
												
											End for 
											$_l_RepeatLine:=$_l_LastLine+1
											$_l_Execute:=$_l_LastLine+1
										End if 
									Else 
										$_bo_RepeatStatement:=False:C215
										
										$_l_endStatementIndex:=Size of array:C274($2->)
										$_bo_noStop:=False:C215
										
									End if 
								End for 
							End if 
						End if 
						If ($_bo_RepeatStatement)  //There is something to Repeat....
							
							$_bo_lineIsTrue:=False:C215
							MAC_bo_LineIsTrue:=False:C215
							//TRACE
							
							
							Repeat 
								If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
									$_l_ScriptLevel:=$_l_ScriptLevel+1
									Macro_Play($_l_ScriptLevel; ->$_at_2DTextBlocks; ->$_at_Commands; ->$_at_ExternalBlocks; ->$_at_2DParameters; ->$_at_Conjuctions)
									If (SCPT_l_Cancel=Current process:C322)
										$_bo_noStop:=False:C215
									End if 
									$_l_ScriptLevel:=$_l_ScriptLevel-1
									//`re-evelaute the while test
									$_bo_lineIsTrue:=False:C215
									MAC_bo_LineIsTrue:=False:C215
									For ($_l_ParametersCount; 1; Size of array:C274($5->{$_l_RepeatLine}))
										If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
											If ($5->{$_l_RepeatLine}{$_l_ParametersCount}#"")
												$_t_Parameter:="("+$5->{$_l_RepeatLine}{$_l_ParametersCount}+")"
												If ($_l_ParametersCount=1)
													EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
												Else 
													$_t_Conjuction:=$6->{$_l_RepeatLine}{$_l_ParametersCount}
													Case of 
														: ($_t_Conjuction="&")
															$_bo_lineIsTrue:=MAC_bo_LineIsTrue
															EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
															MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue & $_bo_lineIsTrue
														: ($_t_Conjuction="|")
															$_bo_lineIsTrue:=MAC_bo_LineIsTrue
															EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
															MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue | $_bo_lineIsTrue
														: ($_t_Conjuction="#")
															$_bo_lineIsTrue:=MAC_bo_LineIsTrue
															EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
															MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue#$_bo_lineIsTrue
														Else 
															$_bo_lineIsTrue:=MAC_bo_LineIsTrue
															EXECUTE FORMULA:C63("MAC_bo_LineIsTrue:="+$_t_Parameter)
															MAC_bo_LineIsTrue:=MAC_bo_LineIsTrue & $_bo_lineIsTrue
													End case 
												End if 
											Else 
												$_l_ParametersCount:=Size of array:C274($5->{$_l_RepeatLine})
												
											End if 
										Else 
											$_bo_noStop:=False:C215
											$_l_ParametersCount:=Size of array:C274($5->{$_l_RepeatLine})
											
										End if 
									End for 
								Else 
									$_bo_noStop:=False:C215
								End if   //```````
								
							Until (MAC_bo_LineIsTrue) | ($_bo_noStop=False:C215)
						End if 
						//````````````````
						
						
					: ($_t_Command="Until")
					: ($_t_Command="Begin SQL")
						$_bo_ExecuteSQL:=False:C215
						
						For ($_l_endStatementIndex; $_l_Execute+1; Size of array:C274($2->))
							If (Not:C34(<>SYS_bo_StopMacros)) & ($_bo_noStop)
								If ($2->{$_l_endStatementIndex}{1}="END SQL")
									$_l_LastLine:=$_l_endStatementIndex+1
									$_l_endStatementIndex:=Size of array:C274($2->)
								End if 
								$_bo_ExecuteSQL:=True:C214
								$_t_SqlStatement:=$4->{$_l_Execute}
							Else 
								$_bo_ExecuteSQL:=False:C215
								$_l_endStatementIndex:=Size of array:C274($2->)
								$_bo_noStop:=False:C215
							End if 
						End for 
						If ($_bo_ExecuteSQL)
							$_ti_DocumentRef:=Create document:C266(DB_GetDocumentPath+"TempSQL.txt")
							SEND PACKET:C103($_ti_DocumentRef; $_t_SqlStatement)
							CLOSE DOCUMENT:C267($_ti_DocumentRef)
							$_t_DocumentPath:=Document
							SQL EXECUTE SCRIPT:C1089($_t_DocumentPath; 1; SQL_Use_Access_Rights; 1)
							DELETE DOCUMENT:C159($_t_SqlStatement)
						End if 
						$_l_Execute:=$_l_LastLine
					: ($_t_Command="Message")
						$_bo_WindowOpen:=True:C214
						$_t_Parameter:=""
						If (Size of array:C274($5->{$_l_Execute})>0)
							
							If ($5->{$_l_Execute}{1}#"")
								If (($5->{$_l_Execute}{1})[[1]]#"(")
									$_t_Parameter:="("+$5->{$_l_Execute}{1}+")"
								Else 
									$_t_Parameter:=$5->{$_l_Execute}{1}
								End if 
							Else 
								$_t_Parameter:=Replace string:C233($_t_ThisLine; $_t_Command; "")
								
								
							End if 
						End if 
						$_t_Message:=First_Param($_t_Parameter; ->$_t_Parameter)
						$_t_Title:=First_Param($_t_Parameter; ->$_t_Parameter)
						
						$_t_ParameterNoQuotes:=STR_RemQuote($_t_Title)
						If ($_l_Right=0)
							$_l_Right:=Record_MessWin($_t_ParameterNoQuotes)
							MAC_l_MessageWindow:=1
						End if 
						If ($_t_Message#"")
							vMTitle3:=""
							MESSAGES OFF:C175
							EXECUTE FORMULA:C63("vMTitle3:="+$_t_Message)
							If ($_t_Parameter#"")
								vMTitle4:=vMTitle3
								HIGHLIGHT TEXT:C210(vMTitle4; 32000; 32000)
								DISPLAY RECORD:C105([SCRIPTS:80])
							End if 
						End if 
						
					: ($_t_Command="Message End")
						$_bo_WindowOpen:=False:C215
						$_l_Right:=0
						If (MAC_l_MessageWindow>0)
							MAC_l_MessageWindow:=0
							CLOSE WINDOW:C154
						End if 
						
					: ($_t_Command="Key")
						$_t_Parameter:=""
						If (Size of array:C274($5->{$_l_Execute})>1)
							If ($5->{$_l_Execute}{1}#"")
								If (($5->{$_l_Execute}{1})[[1]]#"(")
									$_t_Parameter:="("+$5->{$_l_Execute}{1}+")"
								Else 
									$_t_Parameter:=$5->{$_l_Execute}{1}
								End if 
							Else 
								$_t_Parameter:=Replace string:C233($_t_ThisLine; $_t_Command; "")
								
							End if 
							
						End if 
						$_t_ParameterElement1:=First_Param($_t_Parameter; ->$_t_Parameter)
						$_t_ParameterElement2:=First_Param($_t_Parameter; ->$_t_Parameter)
						$_t_ParameterElement2:=STR_RemQuote($_t_ParameterElement2)
						If ($_t_ParameterElement1#"")
							If (Character code:C91(Substring:C12($_t_ParameterElement1; 1; 1))=34)
								$_t_ParameterElement1:=STR_RemQuote($_t_ParameterElement1)
								If (Length:C16($_t_ParameterElement1)=1)
									$_l_Key:=Num:C11($_t_ParameterElement2)
									If (($_l_Key/256)=Abs:C99($_l_Key/256))
										Gen_PostKey(0; Character code:C91($_t_ParameterElement1); $_l_Key)
									End if 
								Else 
									
									$_l_Key:=1
									While ($_l_Key<=Length:C16($_t_ParameterElement1))
										Gen_PostKey(0; Character code:C91(Substring:C12($_t_ParameterElement1; $_l_Key; 1)); 0)
										$_l_Key:=$_l_Key+1
									End while 
								End if 
							Else 
								$_l_Number1:=Num:C11($_t_ParameterElement1)
								$_l_Key:=Num:C11($_t_ParameterElement2)
								If (($_l_Number1>0) & ($_l_Number1<256) & (($_l_Key=0) | (($_l_Key/256)=Abs:C99($_l_Key/256))))
									Gen_PostKey(0; $_l_Number1; $_l_Key)
								End if 
							End if 
						End if 
					: ($_t_Command="Click")
						$_t_Parameter:=""
						If (Size of array:C274($5->{$_l_Execute})>1)
							If ($5->{$_l_Execute}{1}#"")
								If (($5->{$_l_Execute}{1})[[1]]#"(")
									$_t_Parameter:="("+$5->{$_l_Execute}{1}+")"
								Else 
									$_t_Parameter:=$5->{$_l_Execute}{1}
								End if 
							Else 
								$_t_Parameter:=Replace string:C233($_t_ThisLine; $_t_Command; "")
							End if 
							
						End if   //
						
						
						$_t_ParameterElement1:=STR_RemQuote(First_Param($_t_Parameter; ->$_t_Parameter))
						$_t_ParameterElement2:=STR_RemQuote(First_Param($_t_Parameter; ->$_t_Parameter))
						$_t_ParameterElement3:=STR_RemQuote(First_Param($_t_Parameter; ->$_t_Parameter))
						$_l_Mousey:=0
						$_l_Mousex:=0
						$_l_Mousey:=$_l_Mousey+Num:C11($_t_ParameterElement1)
						$_l_Number2:=$_l_Mousex+Num:C11($_t_ParameterElement2)
						$_l_Mousex:=Num:C11($_t_ParameterElement3)
						POST CLICK:C466($_l_Mousex; $_l_Mousey)
					: ($_t_Command="Button")
						$_t_Parameter:=""
						If (Size of array:C274($5->{$_l_Execute})>1)
							If ($5->{$_l_Execute}{1}#"")
								If (($5->{$_l_Execute}{1})[[1]]#"(")
									$_t_Parameter:="("+$5->{$_l_Execute}{1}+")"
								Else 
									$_t_Parameter:=$5->{$_l_Execute}{1}
								End if 
							Else 
								$_t_Parameter:=Replace string:C233($_t_ThisLine; $_t_Command; "")
								
							End if 
							
						End if   //
						
						
						$_t_ParameterElement1:=STR_RemQuote(First_Param($_t_Parameter; ->$_t_Parameter))
						$_t_ParameterElement2:=STR_RemQuote(First_Param($_t_Parameter; ->$_t_Parameter))
						$_t_ParameterElement3:=STR_RemQuote(First_Param($_t_Parameter; ->$_t_Parameter))
						$_l_Number1:=Num:C11($_t_ParameterElement1)+2
						$_l_Mousex:=Num:C11($_t_ParameterElement2)+22+<>SYS_l_WindowTop
						$_l_Number3:=Num:C11($_t_ParameterElement3)
						POST CLICK:C466($_l_Mousex; $_l_Number1)
						POST CLICK:C466($_l_Mousex; $_l_Number1)
					: (($_t_Command="Confirm") | ($_t_Command="ConfirmT") | ($_t_Command="Confirm3") | ($_t_Command="Alert") | ($_t_Command="Request"))
						$_t_Parameter:=""
						If (Size of array:C274($5->{$_l_Execute})>0)
							If ($5->{$_l_Execute}{1}#"")
								If (($5->{$_l_Execute}{1})[[1]]#"(")
									$_t_Parameter:="("+$5->{$_l_Execute}{1}+")"
								Else 
									$_t_Parameter:=$5->{$_l_Execute}{1}
								End if 
							Else 
								$_t_Parameter:=Replace string:C233($_t_ThisLine; $_t_Command; "")
							End if 
						End if   //
						
						Mac_t_ExecuteLine:="Gen "+$_t_Command+$_t_Parameter
						MESSAGES OFF:C175
						EXECUTE FORMULA:C63(Mac_t_ExecuteLine)
						
					: ($_t_Command="Wait for State")
						Record_PlayWfS($_bo_noStop)
					: ($_t_Command="Wait")
						$_t_Parameter:=""
						If (Size of array:C274($5->{$_l_Execute})>=1)
							If ($5->{$_l_Execute}{1}#"")
								If (($5->{$_l_Execute}{1})[[1]]#"(")
									$_t_Parameter:="("+$5->{$_l_Execute}{1}+")"
								Else 
									$_t_Parameter:=$5->{$_l_Execute}{1}
								End if 
							Else 
								$_t_Parameter:=Replace string:C233($_t_ThisLine; $_t_Command; "")
							End if 
						End if   //
						
						$_t_ParameterElement1:=STR_RemQuote(First_Param($_t_Parameter; ->$_t_Parameter))
						MESSAGES OFF:C175
						EXECUTE FORMULA:C63("vMPage:="+$_t_ParameterElement1)
						If (vMPage>0)
							DELAY PROCESS:C323(Current process:C322; vMPage*60)
						End if 
						
					: ($_t_Command="Pause")
						Record_PlayPaus
						
					: ($_t_Command="Wait on Event")
						Record_PlayWoE
						
					: ($_t_Command="Double Click")
						$_t_Parameter:=""
						If (Size of array:C274($5->{$_l_Execute})>=1)
							If ($5->{$_l_Execute}{1}#"")
								If (($5->{$_l_Execute}{1})[[1]]#"(")
									$_t_Parameter:="("+$5->{$_l_Execute}{1}+")"
								Else 
									$_t_Parameter:=$5->{$_l_Execute}{1}
								End if 
							Else 
								$_t_Parameter:=Replace string:C233($_t_ThisLine; $_t_Command; "")
							End if 
							
						End if   //
						
						$_t_ParameterElement1:=STR_RemQuote(First_Param($_t_Parameter; ->$_t_Parameter))
						$_t_ParameterElement2:=STR_RemQuote(First_Param($_t_Parameter; ->$_t_Parameter))
						$_t_ParameterElement3:=STR_RemQuote(First_Param($_t_Parameter; ->$_t_Parameter))
						$_l_MouseY:=0
						$_l_MouseX:=0
						$_l_MouseY:=$_l_MouseY+Num:C11($_t_ParameterElement1)
						$_l_MouseX:=$_l_MouseX+Num:C11($_t_ParameterElement2)
						$_l_MouseX2:=Num:C11($_t_ParameterElement3)
						
						POST CLICK:C466($_l_MouseX; $_l_MouseY)
						POST CLICK:C466($_l_MouseX; $_l_MouseY)
					: ($_t_Command="Menu")
						$_t_Parameter:=""
						If (Size of array:C274($5->{$_l_Execute})>1)
							If ($5->{$_l_Execute}{1}#"")
								If (($5->{$_l_Execute}{1})[[1]]#"(")
									$_t_Parameter:="("+$5->{$_l_Execute}{1}+")"
								Else 
									$_t_Parameter:=$5->{$_l_Execute}{1}
								End if 
							Else 
								$_t_Parameter:=Replace string:C233($_t_ThisLine; $_t_Command; "")
							End if 
						End if   //
						
						$_t_ParameterElement1:=STR_RemQuote(First_Param($_t_Parameter; ->$_t_Parameter))
						$_t_ParameterElement2:=STR_RemQuote(First_Param($_t_Parameter; ->$_t_Parameter))
						$_t_ParameterElement3:=STR_RemQuote(First_Param($_t_Parameter; ->$_t_Parameter))
						Record_PlayMenu($_t_ParameterElement1; Num:C11($_t_ParameterElement2); $_t_ParameterElement3)
						
						
					: ($_t_Command="Execute")
						$_t_Parameter:=""
						If (Size of array:C274($5->{$_l_Execute})>1)
							If ($5->{$_l_Execute}{1}#"")
								$_t_Parameter:=$5->{$_l_Execute}{1}
							End if 
							
						End if 
						MESSAGES OFF:C175
						If ($_t_Parameter#"")
							Record_PlayExec($_t_Parameter)
						End if 
					: ($_t_Command="Evaluate")
						$_t_Parameter:=""
						If (Size of array:C274($5->{$_l_Execute})>1)
							If ($5->{$_l_Execute}{1}#"")
								$_t_Parameter:=$5->{$_l_Execute}{1}
							End if 
							
						End if 
						If ($_t_Parameter#"")
							Record_PlayEval($_t_Parameter)
						End if 
					: ($_t_Command="Accept")
						Gen_PostKey(0; 3; 0)
					: ($_t_Command="Cancel")
						Gen_PostKey(0; 46; 256)
					: ($_t_Command="Return")
						Gen_PostKey(0; 13; 0)
					: ($_t_Command="Tab")
						Gen_PostKey(0; 9; 0)
						
					: ($_t_Command="New Record")
						
						If (<>ButtDis="In@")
							Gen_PostKey(1; 9; 256)
						Else 
							<>ButtPress:="Plus"
							If (Application type:C494#4D Server:K5:6)
								
								$_l_Process:=Frontmost process:C327(*)
								SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Plus"))
								POST OUTSIDE CALL:C329($_l_Process)
							End if 
						End if 
						
					: (($_t_Command="Next") | ($_t_Command="Previous") | ($_t_Command="Last") | ($_t_Command="First") | ($_t_Command="Find") | ($_t_Command="Select") | ($_t_Command="Sort") | ($_t_Command="Count"))
						Record_PlayButt($_t_Command)
					: ($_t_Command="Find More Choices")
						Record_PlayButt("FindO")
					: ($_t_Command="Select Inverse")
						Record_PlayButt("SelectO")
					: ($_t_Command="Set Functions")
						Record_PlayButt("Set")
					: ($_t_Command="Report Generator")
						Record_PlayButt("Report")
					: ($_t_Command="Graph Generator")
						Record_PlayButt("Graph")
					: ($_t_Command="Global Change")
						Record_PlayButt("Apply")
					: ($_t_Command="Dial@") & ($_t_Command#"DIALOG")  //Dial Optons is a second choice but is not currently used
						
						Record_PlayButt("Tel")
					: ($_t_Command="Menus")
						Menus_Button
					: ($_t_Command="Backspace")
						Gen_PostKey(0; 8; 0)
						
					: ($_t_Command="New Process") | ($_t_Command="EXECUTE ON SERVER")
						$_at_2DParameters:=0
						$_t_MethodName:=""
						$_t_ProcessMemoryString:=""
						$_t_ProcessName:=""
						$_bo_UniqueProcess:=False:C215
						
						ARRAY POINTER:C280($_aPtr_ParameterTopass; 0)
						ARRAY TEXT:C222($_at_Parameters; 0)
						ARRAY BOOLEAN:C223($_abo_Parameters; 0)
						ARRAY REAL:C219($_ar_Parameters; 0)
						ARRAY TIME:C1223($_ati_Times; 0)
						ARRAY DATE:C224($_ad_Dates; 0)
						ARRAY LONGINT:C221($_al_Parameters; 0)
						ARRAY PICTURE:C279($_apic_Parameters; 0)
						$_l_BlobReference:=0
						MAC_at_LiteralString:=""
						//unlike with the for loop where we know the paramters resolve to numbers will resolve to numeric values
						//with a process we dont know what the parameters will resolve to so how do we handle them
						$_t_ParameterString:=""
						$_bo_NoRun:=False:C215
						For ($_l_CNP; 1; Size of array:C274($5->{$_l_Execute}))
							If ($5->{$_l_Execute}{$_l_CNP}#"")
								$_at_2DParameters:=$_at_2DParameters+1
								Case of 
									: ($_l_CNP=1)
										$_t_ProcessIDString:=$5->{$_l_Execute}{$_l_CNP}
									: ($_l_CNP=2)
										$_t_MethodName:=$5->{$_l_Execute}{$_l_CNP}
									: ($_l_CNP=3)
										$_t_ProcessMemoryString:=$5->{$_l_Execute}{$_l_CNP}
									: ($_l_CNP=4)
										$_t_ProcessName:=$5->{$_l_Execute}{$_l_CNP}
									Else 
										If ($5->{$_l_Execute}{$_l_CNP}#"")
											Case of 
												: ($5->{$_l_Execute}{$_l_CNP}[[1]]="-") & ($5->{$_l_Execute}{$_l_CNP}[[1]]=">")
													//IGNORE THE STATEMENTS ITS A POINTER!
													APPEND TO ARRAY:C911($_at_Parameters; "")
													APPEND TO ARRAY:C911($_aPtr_ParameterTopass; ->$_at_Parameters)
													APPEND TO ARRAY:C911($_abo_Parameters; False:C215)
													APPEND TO ARRAY:C911($_ar_Parameters; 0)
													APPEND TO ARRAY:C911($_al_Parameters; 0)
													APPEND TO ARRAY:C911($_ad_Dates; !00-00-00!)
													APPEND TO ARRAY:C911($_ati_Times; 0)
													APPEND TO ARRAY:C911($_apic_Parameters; 0)
													$_bo_NoRun:=True:C214
													Gen_Alert("Pointers may not be passed to a call to new process")
													
													
												: ($5->{$_l_Execute}{$_l_CNP}[[1]]="[")
													//Field...what if more than one field as in [contacts]first name+[contacts]surname?
													//or this could be a boolean[contacts]first#"")&([contacts]last name#"") ???-no because that would have a bracket
													$_t_ParameterString:=$5->{$_l_Execute}{$_l_CNP}
													
													$_l_CharacterPosition:=Position:C15("+"; $_t_ParameterString)
													
													If ($_l_CharacterPosition=0)
														$_l_EndTableBracketPosition:=Position:C15("]"; $_t_ParameterString)
														$_t_TableName:=Substring:C12($_t_ParameterString; 1; $_l_EndTableBracketPosition)
														$_t_FieldName:=Substring:C12($_t_ParameterString; $_l_EndTableBracketPosition+1)
														//```
														$_t_TableName:=Replace string:C233($_t_TableName; "["; "")
														$_t_TableName:=Replace string:C233($_t_TableName; "]"; "")
														$_l_FieldNumber:=0
														$_l_TableNumber:=0
														For ($_l_FindTableIndex; 1; Get last table number:C254)
															If (Is table number valid:C999($_l_FindTableIndex))
																$_bo_isaTable:=(Table name:C256($_l_FindTableIndex)=$_t_TableName)
																If ($_bo_isaTable)
																	$_l_TableNumber:=$_l_FindTableIndex
																	//Get the field names of that table
																	
																	
																	$_bo_isaField:=False:C215
																	$_l_FieldCount:=Get last field number:C255($_l_FindTableIndex)
																	For ($_l_FindFIeldIndex; 1; $_l_FieldCount)
																		If (Is field number valid:C1000($_l_FindTableIndex; $_l_FindFIeldIndex))
																			$_t_ThisFieldName:=Field name:C257($_l_FindTableIndex; $_l_FindFIeldIndex)
																			If ($_t_ThisFieldName=$_t_FieldName)
																				$_l_FieldNumber:=$_l_FindFIeldIndex
																				$_l_FindFIeldIndex:=$_l_FieldCount
																			End if 
																		End if 
																	End for 
																	$_l_FindTableIndex:=Get last table number:C254
																End if 
															End if 
														End for 
														
														//````
														If ($_l_FieldNumber>0)
															$_ptr_FieldPointer:=Field:C253($_l_TableNumber; $_l_FieldNumber)
															//Get pointer($5->{$_l_Execute}{$_l_CNP})
															If (Not:C34(Is nil pointer:C315($_ptr_FieldPointer)))
																
																$_l_DataType:=Type:C295($_ptr_FieldPointer->)
																Case of 
																	: ($_l_DataType=Is longint:K8:6) | ($_l_DataType=Is real:K8:4) | ($_l_DataType=Is integer:K8:5)
																		
																		APPEND TO ARRAY:C911($_ar_Parameters; (($_ptr_FieldPointer->)))
																		APPEND TO ARRAY:C911($_aPtr_ParameterTopass; ->$_ar_Parameters)
																		APPEND TO ARRAY:C911($_ati_Times; 0)
																		APPEND TO ARRAY:C911($_al_Parameters; 0)
																		APPEND TO ARRAY:C911($_at_Parameters; "")
																		APPEND TO ARRAY:C911($_abo_Parameters; False:C215)
																		APPEND TO ARRAY:C911($_apic_Parameters; 0)
																		APPEND TO ARRAY:C911($_ad_Dates; !00-00-00!)
																	: ($_l_DataType=Is time:K8:8)
																		
																		APPEND TO ARRAY:C911($_ati_Times; (($_ptr_FieldPointer->)))
																		APPEND TO ARRAY:C911($_aPtr_ParameterTopass; ->$_ati_Times)
																		APPEND TO ARRAY:C911($_ar_Parameters; 0)
																		APPEND TO ARRAY:C911($_al_Parameters; 0)
																		APPEND TO ARRAY:C911($_at_Parameters; "")
																		APPEND TO ARRAY:C911($_abo_Parameters; False:C215)
																		APPEND TO ARRAY:C911($_apic_Parameters; 0)
																		APPEND TO ARRAY:C911($_ad_Dates; !00-00-00!)
																	: ($_l_DataType=Is picture:K8:10)
																		
																		APPEND TO ARRAY:C911($_apic_Parameters; $_ptr_FieldPointer->)
																		APPEND TO ARRAY:C911($_aPtr_ParameterTopass; ->$_apic_Parameters)
																		APPEND TO ARRAY:C911($_ar_Parameters; 0)
																		APPEND TO ARRAY:C911($_al_Parameters; 0)
																		APPEND TO ARRAY:C911($_at_Parameters; "")
																		APPEND TO ARRAY:C911($_abo_Parameters; False:C215)
																		APPEND TO ARRAY:C911($_ati_Times; 0)
																		APPEND TO ARRAY:C911($_ad_Dates; !00-00-00!)
																	: ($_l_DataType=Is BLOB:K8:12)
																		
																		$_l_BlobReference:=$_l_BlobReference+1
																		$_ptr_DataVariable:=Get pointer:C304("MAC_Bl_Blobs"+String:C10($_l_BlobReference))
																		$_ptr_DataVariable->:=$_ptr_FieldPointer->
																		APPEND TO ARRAY:C911($_aPtr_ParameterTopass; $_ptr_DataVariable)
																		APPEND TO ARRAY:C911($_al_Parameters; 0)
																		APPEND TO ARRAY:C911($_ar_Parameters; 0)
																		APPEND TO ARRAY:C911($_at_Parameters; "")
																		APPEND TO ARRAY:C911($_ad_Dates; !00-00-00!)
																		APPEND TO ARRAY:C911($_abo_Parameters; False:C215)
																		APPEND TO ARRAY:C911($_ati_Times; 0)
																		APPEND TO ARRAY:C911($_apic_Parameters; 0)
																	: ($_l_DataType=Is date:K8:7)
																		
																		APPEND TO ARRAY:C911($_ad_Dates; $_ptr_FieldPointer->)
																		APPEND TO ARRAY:C911($_aPtr_ParameterTopass; ->$_ad_Dates)
																		APPEND TO ARRAY:C911($_ar_Parameters; 0)
																		APPEND TO ARRAY:C911($_al_Parameters; 0)
																		APPEND TO ARRAY:C911($_at_Parameters; "")
																		APPEND TO ARRAY:C911($_abo_Parameters; False:C215)
																		APPEND TO ARRAY:C911($_ati_Times; 0)
																		APPEND TO ARRAY:C911($_apic_Parameters; 0)
																	: ($_l_DataType=Is boolean:K8:9)
																		
																		APPEND TO ARRAY:C911($_abo_Parameters; $_ptr_FieldPointer->)
																		APPEND TO ARRAY:C911($_aPtr_ParameterTopass; ->$_abo_Parameters)
																		APPEND TO ARRAY:C911($_ar_Parameters; 0)
																		APPEND TO ARRAY:C911($_al_Parameters; 0)
																		APPEND TO ARRAY:C911($_at_Parameters; "")
																		APPEND TO ARRAY:C911($_ad_Dates; !00-00-00!)
																		APPEND TO ARRAY:C911($_ati_Times; 0)
																		APPEND TO ARRAY:C911($_apic_Parameters; 0)
																	Else 
																		APPEND TO ARRAY:C911($_at_Parameters; $_ptr_FieldPointer->)
																		APPEND TO ARRAY:C911($_aPtr_ParameterTopass; ->$_at_Parameters)
																		APPEND TO ARRAY:C911($_abo_Parameters; False:C215)
																		APPEND TO ARRAY:C911($_al_Parameters; 0)
																		APPEND TO ARRAY:C911($_ar_Parameters; 0)
																		APPEND TO ARRAY:C911($_ad_Dates; !00-00-00!)
																		APPEND TO ARRAY:C911($_ati_Times; 0)
																		APPEND TO ARRAY:C911($_apic_Parameters; 0)
																End case 
															End if 
															
														End if 
													Else 
														$_bo_NoRun:=True:C214
														Gen_Alert("The call to new process via a macro may not contain multiple values in a parameter, pass the concatenated value into a variable first")
													End if 
													
													
												: ($5->{$_l_Execute}{$_l_CNP}[[1]]=Char:C90(34))
													//its a literal-a string
													$_t_Evaluate:=Substring:C12($5->{$_l_Execute}{$_l_CNP}; 2)
													$_l_StringLength:=Length:C16($_t_Evaluate)
													$_t_Evaluate:=Substring:C12($_t_Evaluate; 1; $_l_StringLength-1)
													EXECUTE FORMULA:C63("MAC_at_LiteralString:="+$_t_Evaluate)
													APPEND TO ARRAY:C911($_at_Parameters; MAC_at_LiteralString)
													APPEND TO ARRAY:C911($_aPtr_ParameterTopass; ->$_at_Parameters)
													APPEND TO ARRAY:C911($_abo_Parameters; False:C215)
													APPEND TO ARRAY:C911($_al_Parameters; 0)
													APPEND TO ARRAY:C911($_ar_Parameters; 0)
													APPEND TO ARRAY:C911($_ad_Dates; !00-00-00!)
													APPEND TO ARRAY:C911($_ati_Times; 0)
													APPEND TO ARRAY:C911($_apic_Parameters; 0)
													
												: ($5->{$_l_Execute}{$_l_CNP}="TRUE")
													APPEND TO ARRAY:C911($_abo_Parameters; True:C214)
													APPEND TO ARRAY:C911($_aPtr_ParameterTopass; ->$_abo_Parameters)
													APPEND TO ARRAY:C911($_at_Parameters; "")
													APPEND TO ARRAY:C911($_al_Parameters; 0)
													APPEND TO ARRAY:C911($_ar_Parameters; 0)
													APPEND TO ARRAY:C911($_ad_Dates; !00-00-00!)
													APPEND TO ARRAY:C911($_ati_Times; 0)
													APPEND TO ARRAY:C911($_apic_Parameters; 0)
												: ($5->{$_l_Execute}{$_l_CNP}="FALSE")
													APPEND TO ARRAY:C911($_abo_Parameters; False:C215)
													APPEND TO ARRAY:C911($_aPtr_ParameterTopass; ->$_abo_Parameters)
													APPEND TO ARRAY:C911($_at_Parameters; "")
													APPEND TO ARRAY:C911($_al_Parameters; 0)
													APPEND TO ARRAY:C911($_ar_Parameters; 0)
													APPEND TO ARRAY:C911($_ad_Dates; !00-00-00!)
													APPEND TO ARRAY:C911($_ati_Times; 0)
													APPEND TO ARRAY:C911($_apic_Parameters; 0)
												: ($5->{$_l_Execute}{$_l_CNP}[[1]]="*")
													$_bo_UniqueProcess:=True:C214
													$_at_2DParameters:=$_at_2DParameters-1
												Else 
													$_bo_NoRun:=True:C214
													Gen_Alert("The call to new process via a macro may not contain calculated values in a parameter, pass the calculated value into a variable first")
													
													
											End case 
										End if 
								End case 
							End if 
						End for 
						If (Not:C34($_bo_NoRun))
							If ($_at_2DParameters>=2)
								//must be 2 because 1 is the return value and 2 is the method name
								Case of 
									: ($_at_2DParameters=2)
										//Just the return value and the method name-default the procuess name and the amount of memory
										//$_t_MethodName:
										If ($_t_Command="EXECUTE ON SERVER")
											If ($_bo_UniqueProcess)
												$_l_NewProcessID:=Execute on server:C373($_t_MethodName; 128000; "New Process"; *)
											Else 
												$_l_NewProcessID:=Execute on server:C373($_t_MethodName; 128000; "New Process")
											End if 
											
										Else 
											If ($_bo_UniqueProcess)
												$_l_NewProcessID:=New process:C317($_t_MethodName; 128000; "New Process"; *)
											Else 
												$_l_NewProcessID:=New process:C317($_t_MethodName; 128000; "New Process"; *)
											End if 
										End if 
										$_ptr_ReturnVariable:=Get pointer:C304($_t_ProcessIDString)
										$_ptr_ReturnVariable->:=$_l_NewProcessID
										
										
									: ($_at_2DParameters=3)
										$_l_MemoryStack:=Num:C11($_t_ProcessMemoryString)
										//Just the return value  the method namea and the amount of memory default the the procuess name
										If ($_t_Command="EXECUTE ON SERVER")
											If ($_bo_UniqueProcess)
												$_l_NewProcessID:=Execute on server:C373($_t_MethodName; $_l_MemoryStack; "New Process"; *)
											Else 
												$_l_NewProcessID:=Execute on server:C373($_t_MethodName; $_l_MemoryStack; "New Process")
											End if 
											
										Else 
											If ($_bo_UniqueProcess)
												$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; "New Process"; *)
											Else 
												$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; "New Process"; *)
											End if 
										End if 
										$_ptr_ReturnVariable:=Get pointer:C304($_t_ProcessIDString)
										$_ptr_ReturnVariable->:=$_l_NewProcessID
										
										
									: ($_at_2DParameters=4)
										//Just the return value  the method namea and the amount of memory and  the the procuess name
										$_l_MemoryStack:=Num:C11($_t_ProcessMemoryString)
										//Just the return value  the method namea and the amount of memory default the the procuess name
										If ($_t_Command="EXECUTE ON SERVER")
											If ($_bo_UniqueProcess)
												$_l_NewProcessID:=Execute on server:C373($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; *)
											Else 
												$_l_NewProcessID:=Execute on server:C373($_t_MethodName; $_l_MemoryStack; $_t_ProcessName)
											End if 
										Else 
											
											If ($_bo_UniqueProcess)
												$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; *)
											Else 
												$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; *)
											End if 
										End if 
										$_ptr_ReturnVariable:=Get pointer:C304($_t_ProcessIDString)
										$_ptr_ReturnVariable->:=$_l_NewProcessID
										
									: ($_at_2DParameters>=5)  //One real parameter
										
										$_ptr_ParameterArrayElement1:=$_aPtr_ParameterTopass{1}
										
										RESOLVE POINTER:C394($_ptr_Parameter1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
										Case of 
											: ($_t_VariableName="$_ati_Times")
												$_ti_ThisValue:=$_ptr_ParameterArrayElement1->{1}
												$_ptr_Parameter1:=->$_ti_ThisValue
											: ($_t_VariableName="$_abo_Parameters")
												$_bo_ThisValue:=$_ptr_ParameterArrayElement1->{1}
												$_ptr_Parameter1:=->$_bo_ThisValue
											: ($_t_VariableName="$_ar_Parameters")
												$_r_ThisValue:=$_ptr_ParameterArrayElement1->{1}
												$_ptr_Parameter1:=->$_r_ThisValue
											: ($_t_VariableName="$_ad_Dates")
												$_d_ThisValue:=$_ptr_ParameterArrayElement1->{1}
												$_ptr_Parameter1:=->$_d_ThisValue
											: ($_t_VariableName="$_apic_Parameters")
												$_pic_ThisValue:=$_ptr_ParameterArrayElement1->{1}
												$_ptr_Parameter1:=->$_pic_ThisValue
											Else 
												$_t_ThisValue:=$_ptr_ParameterArrayElement1->{1}
												$_ptr_Parameter1:=->$_t_ThisValue
										End case 
										If ($_at_2DParameters>=6)
											$_ptr_ParameterArrayElement2:=$_aPtr_ParameterTopass{2}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement2; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue2:=$_ptr_ParameterArrayElement2->{2}
													$_ptr_Parameter2:=->$_ti_ThisValue2
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue2:=$_ptr_ParameterArrayElement2->{2}
													$_ptr_Parameter2:=->$_bo_ThisValue2
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue2:=$_ptr_ParameterArrayElement2->{2}
													$_ptr_Parameter2:=->$_r_ThisValue2
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue2:=$_ptr_ParameterArrayElement2->{2}
													$_ptr_Parameter2:=->$_d_ThisValue2
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue2:=$_ptr_ParameterArrayElement2->{2}
													$_ptr_Parameter2:=->$_pic_ThisValue2
												Else 
													$_t_ThisValue2:=$_ptr_ParameterArrayElement2->{2}
													$_ptr_Parameter2:=->$_t_ThisValue2
											End case 
											
											
											
										End if 
										If ($_at_2DParameters>=7)
											$_ptr_ParameterArrayElement3:=$_aPtr_ParameterTopass{3}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement3; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue3:=Time:C179(Time string:C180($_ptr_ParameterArrayElement3->{3}))
													$_ptr_Parameter3:=->$_ti_ThisValue2
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue3:=$_ptr_ParameterArrayElement3->{3}
													$_ptr_Parameter3:=->$_bo_ThisValue3
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue3:=$_ptr_ParameterArrayElement3->{3}
													$_ptr_Parameter3:=->$_r_ThisValue3
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue3:=$_ptr_ParameterArrayElement3->{3}
													$_ptr_Parameter3:=->$_d_ThisValue3
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue3:=$_ptr_ParameterArrayElement3->{3}
													$_ptr_Parameter3:=->$_pic_ThisValue3
												Else 
													$_t_ThisValue3:=$_ptr_ParameterArrayElement3->{3}
													$_ptr_Parameter3:=->$_t_ThisValue3
											End case 
											
											
											
										End if 
										If ($_at_2DParameters>=8)
											$_ptr_ParameterArrayElement4:=$_aPtr_ParameterTopass{4}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue4:=Time:C179(Time string:C180($_ptr_ParameterArrayElement4->{4}))
													$_ptr_Parameter4:=->$_ti_ThisValue4
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue4:=$_ptr_ParameterArrayElement4->{4}
													$_ptr_Parameter4:=->$_bo_ThisValue4
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue4:=$_ptr_ParameterArrayElement4->{4}
													$_ptr_Parameter4:=->$_r_ThisValue4
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue4:=$_ptr_ParameterArrayElement4->{4}
													$_ptr_Parameter4:=->$_d_ThisValue4
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue4:=$_ptr_ParameterArrayElement4->{4}
													$_ptr_Parameter4:=->$_pic_ThisValue4
												Else 
													$_t_ThisValue4:=$_ptr_ParameterArrayElement4->{4}
													$_ptr_Parameter4:=->$_t_ThisValue4
											End case 
											
											
											
										End if 
										If ($_at_2DParameters>=9)
											$_ptr_ParameterArrayElement5:=$_aPtr_ParameterTopass{5}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement5; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue5:=Time:C179(Time string:C180($_ptr_ParameterArrayElement5->{5}))
													$_ptr_Parameter5:=->$_ti_ThisValue5
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue5:=$_ptr_ParameterArrayElement5->{5}
													$_ptr_Parameter5:=->$_bo_ThisValue5
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue5:=$_ptr_ParameterArrayElement5->{5}
													$_ptr_Parameter5:=->$_r_ThisValue5
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue5:=$_ptr_ParameterArrayElement5->{5}
													$_ptr_Parameter5:=->$_d_ThisValue5
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue5:=$_ptr_ParameterArrayElement5->{5}
													$_ptr_Parameter5:=->$_pic_ThisValue5
												Else 
													$_t_ThisValue5:=$_ptr_ParameterArrayElement5->{5}
													$_ptr_Parameter5:=->$_t_ThisValue5
											End case 
											
											
											
										End if 
										If ($_at_2DParameters>=10)
											$_ptr_ParameterArrayElement6:=$_aPtr_ParameterTopass{6}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement6; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue6:=Time:C179(Time string:C180($_ptr_ParameterArrayElement6->{6}))
													$_ptr_Parameter6:=->$_ti_ThisValue6
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue6:=$_ptr_ParameterArrayElement6->{6}
													$_ptr_Parameter6:=->$_bo_ThisValue6
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue6:=$_ptr_ParameterArrayElement6->{6}
													$_ptr_Parameter6:=->$_r_ThisValue6
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue6:=$_ptr_ParameterArrayElement6->{6}
													$_ptr_Parameter6:=->$_d_ThisValue6
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue6:=$_ptr_ParameterArrayElement6->{6}
													$_ptr_Parameter6:=->$_pic_ThisValue6
												Else 
													$_t_ThisValue6:=$_ptr_ParameterArrayElement6->{6}
													$_ptr_Parameter6:=->$_t_ThisValue6
											End case 
											
										End if 
										If ($_at_2DParameters>=11)
											$_ptr_ParameterArrayElement7:=$_aPtr_ParameterTopass{7}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement7; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue7:=$_ptr_ParameterArrayElement7->{7}
													$_ptr_Parameter7:=->$_ti_ThisValue7
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue7:=$_ptr_ParameterArrayElement7->{7}
													$_ptr_Parameter7:=->$_bo_ThisValue7
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue7:=$_ptr_ParameterArrayElement7->{7}
													$_ptr_Parameter7:=->$_r_ThisValue7
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue7:=$_ptr_ParameterArrayElement7->{7}
													$_ptr_Parameter7:=->$_d_ThisValue7
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue7:=$_ptr_ParameterArrayElement7->{7}
													$_ptr_Parameter7:=->$_pic_ThisValue7
												Else 
													$_t_ThisValue7:=$_ptr_ParameterArrayElement7->{7}
													$_ptr_Parameter7:=->$_t_ThisValue7
											End case 
											
										End if 
										If ($_at_2DParameters>=12)
											$_ptr_ParameterArrayElement8:=$_aPtr_ParameterTopass{8}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement8; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue8:=$_ptr_ParameterArrayElement8->{8}
													
													$_ptr_Parameter8:=->$_ti_ThisValue8
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue8:=$_ptr_ParameterArrayElement8->{8}
													$_ptr_Parameter8:=->$_bo_ThisValue8
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue8:=$_ptr_ParameterArrayElement8->{8}
													$_ptr_Parameter8:=->$_r_ThisValue8
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue8:=$_ptr_ParameterArrayElement8->{8}
													$_ptr_Parameter8:=->$_d_ThisValue8
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue8:=$_ptr_ParameterArrayElement8->{8}
													$_ptr_Parameter8:=->$_pic_ThisValue8
												Else 
													$_t_ThisValue8:=$_ptr_ParameterArrayElement8->{8}
													$_ptr_Parameter8:=->$_t_ThisValue8
											End case 
											
										End if 
										If ($_at_2DParameters>=13)
											$_ptr_ParameterArrayElement9:=$_aPtr_ParameterTopass{9}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement9; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue9:=$_ptr_ParameterArrayElement9->{9}
													$_ptr_Parameter9:=->$_ti_ThisValue9
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue9:=$_ptr_ParameterArrayElement9->{9}
													$_ptr_Parameter9:=->$_bo_ThisValue9
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue9:=$_ptr_ParameterArrayElement9->{9}
													$_ptr_Parameter9:=->$_r_ThisValue9
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue9:=$_ptr_ParameterArrayElement9->{9}
													$_ptr_Parameter9:=->$_d_ThisValue9
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue9:=$_ptr_ParameterArrayElement9->{9}
													$_ptr_Parameter9:=->$_pic_ThisValue9
												Else 
													$_t_ThisValue9:=$_ptr_ParameterArrayElement9->{9}
													$_ptr_Parameter9:=->$_t_ThisValue9
											End case 
											
										End if 
										If ($_at_2DParameters>=13)
											$_ptr_ParameterArrayElement10:=$_aPtr_ParameterTopass{10}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement10; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue10:=$_ptr_ParameterArrayElement10->{10}
													$_ptr_Parameter10:=->$_ti_ThisValue10
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue10:=$_ptr_ParameterArrayElement10->{10}
													$_ptr_Parameter10:=->$_bo_ThisValue10
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue10:=$_ptr_ParameterArrayElement10->{10}
													$_ptr_Parameter10:=->$_r_ThisValue10
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue10:=$_ptr_ParameterArrayElement10->{10}
													$_ptr_Parameter10:=->$_d_ThisValue10
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue10:=$_ptr_ParameterArrayElement10->{10}
													$_ptr_Parameter10:=->$_pic_ThisValue10
												Else 
													$_t_ThisValue10:=$_ptr_ParameterArrayElement10->{10}
													$_ptr_Parameter10:=->$_t_ThisValue10
											End case 
											
										End if 
										
										If ($_at_2DParameters>=14)
											$_ptr_ParameterArrayElement11:=$_aPtr_ParameterTopass{11}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement11; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue11:=$_ptr_ParameterArrayElement11->{11}
													$_ptr_Parameter11:=->$_ti_ThisValue11
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue11:=$_ptr_ParameterArrayElement11->{11}
													$_ptr_Parameter11:=->$_bo_ThisValue11
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue11:=$_ptr_ParameterArrayElement11->{11}
													$_ptr_Parameter11:=->$_r_ThisValue11
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue11:=$_ptr_ParameterArrayElement11->{11}
													$_ptr_Parameter11:=->$_d_ThisValue11
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue11:=$_ptr_ParameterArrayElement11->{11}
													$_ptr_Parameter11:=->$_pic_ThisValue11
												Else 
													$_t_ThisValue11:=$_ptr_ParameterArrayElement11->{11}
													$_ptr_Parameter11:=->$_t_ThisValue11
											End case 
											
										End if 
										If ($_at_2DParameters>=15)
											$_ptr_ParameterArrayElement12:=$_aPtr_ParameterTopass{12}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement12; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue12:=Time:C179(Time string:C180($_ptr_ParameterArrayElement12->{12}))
													$_ptr_Parameter12:=->$_ti_ThisValue12
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue12:=$_ptr_ParameterArrayElement12->{12}
													$_ptr_Parameter12:=->$_bo_ThisValue12
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue12:=$_ptr_ParameterArrayElement12->{12}
													$_ptr_Parameter12:=->$_r_ThisValue12
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue12:=$_ptr_ParameterArrayElement12->{12}
													$_ptr_Parameter12:=->$_d_ThisValue12
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue12:=$_ptr_ParameterArrayElement12->{12}
													$_ptr_Parameter12:=->$_pic_ThisValue12
												Else 
													$_t_ThisValue12:=$_ptr_ParameterArrayElement12->{12}
													$_ptr_Parameter12:=->$_t_ThisValue12
											End case 
											
										End if 
										If ($_at_2DParameters>=16)
											$_ptr_ParameterArrayElement13:=$_aPtr_ParameterTopass{13}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement13; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue13:=$_ptr_ParameterArrayElement13->{13}
													$_ptr_Parameter13:=->$_ti_ThisValue13
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue13:=$_ptr_ParameterArrayElement13->{13}
													$_ptr_Parameter13:=->$_bo_ThisValue13
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue13:=$_ptr_ParameterArrayElement13->{13}
													$_ptr_Parameter13:=->$_r_ThisValue13
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue13:=$_ptr_ParameterArrayElement13->{13}
													$_ptr_Parameter13:=->$_d_ThisValue13
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue13:=$_ptr_ParameterArrayElement13->{13}
													$_ptr_Parameter13:=->$_pic_ThisValue13
												Else 
													$_t_ThisValue13:=$_ptr_ParameterArrayElement13->{13}
													$_ptr_Parameter13:=->$_t_ThisValue13
											End case 
											
										End if 
										If ($_at_2DParameters>=17)
											$_ptr_ParameterArrayElement14:=$_aPtr_ParameterTopass{14}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement14; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue14:=Time:C179(Time string:C180($_ptr_ParameterArrayElement14->{14}))
													$_ptr_Parameter14:=->$_ti_ThisValue14
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue14:=$_ptr_ParameterArrayElement14->{14}
													$_ptr_Parameter14:=->$_bo_ThisValue14
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue14:=$_ptr_ParameterArrayElement14->{14}
													$_ptr_Parameter14:=->$_r_ThisValue14
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue14:=$_ptr_ParameterArrayElement14->{14}
													$_ptr_Parameter14:=->$_d_ThisValue14
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue14:=$_ptr_ParameterArrayElement14->{14}
													$_ptr_Parameter14:=->$_pic_ThisValue14
												Else 
													$_t_ThisValue14:=$_ptr_ParameterArrayElement14->{14}
													$_ptr_Parameter14:=->$_t_ThisValue14
											End case 
											
										End if 
										If ($_at_2DParameters>=18)
											$_ptr_ParameterArrayElement15:=$_aPtr_ParameterTopass{15}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement15; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue15:=$_ptr_ParameterArrayElement15->{15}
													$_ptr_Parameter15:=->$_ti_ThisValue15
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue15:=$_ptr_ParameterArrayElement15->{15}
													$_ptr_Parameter15:=->$_bo_ThisValue15
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue15:=$_ptr_ParameterArrayElement15->{15}
													$_ptr_Parameter15:=->$_r_ThisValue15
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue15:=$_ptr_ParameterArrayElement15->{15}
													$_ptr_Parameter15:=->$_d_ThisValue15
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue15:=$_ptr_ParameterArrayElement15->{15}
													$_ptr_Parameter15:=->$_pic_ThisValue15
												Else 
													$_t_ThisValue15:=$_ptr_ParameterArrayElement15->{15}
													$_ptr_Parameter15:=->$_t_ThisValue15
											End case 
											
										End if 
										If ($_at_2DParameters>=19)
											$_ptr_ParameterArrayElement16:=$_aPtr_ParameterTopass{16}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement16; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue16:=$_ptr_ParameterArrayElement16->{16}
													$_ptr_Parameter16:=->$_ti_ThisValue16
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue16:=$_ptr_ParameterArrayElement16->{16}
													$_ptr_Parameter16:=->$_bo_ThisValue16
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue16:=$_ptr_ParameterArrayElement16->{16}
													$_ptr_Parameter16:=->$_r_ThisValue16
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue16:=$_ptr_ParameterArrayElement16->{16}
													$_ptr_Parameter16:=->$_d_ThisValue16
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue16:=$_ptr_ParameterArrayElement16->{16}
													$_ptr_Parameter16:=->$_pic_ThisValue16
												Else 
													$_t_ThisValue16:=$_ptr_ParameterArrayElement16->{16}
													$_ptr_Parameter16:=->$_t_ThisValue16
											End case 
											
										End if 
										If ($_at_2DParameters>=20)
											$_ptr_ParameterArrayElement17:=$_aPtr_ParameterTopass{17}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement17; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue17:=$_ptr_ParameterArrayElement17->{17}
													
													$_ptr_Parameter17:=->$_ti_ThisValue7
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue17:=$_ptr_ParameterArrayElement17->{17}
													$_ptr_Parameter17:=->$_bo_ThisValue17
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue17:=$_ptr_ParameterArrayElement17->{17}
													$_ptr_Parameter17:=->$_r_ThisValue17
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue17:=$_ptr_ParameterArrayElement17->{17}
													$_ptr_Parameter17:=->$_d_ThisValue17
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue17:=$_ptr_ParameterArrayElement17->{17}
													$_ptr_Parameter17:=->$_pic_ThisValue17
												Else 
													$_t_ThisValue17:=$_ptr_ParameterArrayElement17->{17}
													$_ptr_Parameter17:=->$_t_ThisValue17
											End case 
											
										End if 
										If ($_at_2DParameters>=21)
											$_ptr_ParameterArrayElement18:=$_aPtr_ParameterTopass{18}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement18; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue18:=$_ptr_ParameterArrayElement18->{18}
													$_ptr_Parameter18:=->$_ti_ThisValue18
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue18:=$_ptr_ParameterArrayElement18->{18}
													$_ptr_Parameter18:=->$_bo_ThisValue18
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue18:=$_ptr_ParameterArrayElement18->{18}
													$_ptr_Parameter18:=->$_r_ThisValue18
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue18:=$_ptr_ParameterArrayElement18->{18}
													$_ptr_Parameter18:=->$_d_ThisValue18
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue18:=$_ptr_ParameterArrayElement18->{18}
													$_ptr_Parameter18:=->$_pic_ThisValue18
												Else 
													$_t_ThisValue18:=$_ptr_ParameterArrayElement18->{18}
													$_ptr_Parameter18:=->$_t_ThisValue18
											End case 
											
										End if 
										If ($_at_2DParameters>=22)
											$_ptr_ParameterArrayElement19:=$_aPtr_ParameterTopass{19}
											
											RESOLVE POINTER:C394($_ptr_ParameterArrayElement19; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
											Case of 
												: ($_t_VariableName="$_ati_Times")
													$_ti_ThisValue19:=Time:C179(Time string:C180($_ptr_ParameterArrayElement19->{19}))
													$_ptr_Parameter19:=->$_ti_ThisValue19
												: ($_t_VariableName="$_abo_Parameters")
													$_bo_ThisValue19:=$_ptr_ParameterArrayElement19->{19}
													$_ptr_Parameter19:=->$_bo_ThisValue19
												: ($_t_VariableName="$_ar_Parameters")
													$_r_ThisValue19:=$_ptr_ParameterArrayElement19->{19}
													$_ptr_Parameter19:=->$_r_ThisValue19
												: ($_t_VariableName="$_ad_Dates")
													$_d_ThisValue19:=$_ptr_ParameterArrayElement19->{19}
													$_ptr_Parameter19:=->$_d_ThisValue19
												: ($_t_VariableName="$_apic_Parameters")
													$_pic_ThisValue19:=$_ptr_ParameterArrayElement19->{19}
													$_ptr_Parameter19:=->$_pic_ThisValue19
												Else 
													$_t_ThisValue19:=$_ptr_ParameterArrayElement19->{19}
													$_ptr_Parameter19:=->$_t_ThisValue19
											End case 
											
										End if 
										If ($_at_2DParameters>=23)
											Gen_Alert("Currently new process called from a macro is limited to 19 parameters")
											$_bo_NoRun:=True:C214
										End if 
										If (Not:C34($_bo_NoRun))
											$_l_MemoryStack:=Num:C11($_t_ProcessMemoryString)
											$_t_processName:="Cont_SelP"
											$_t_UniqueProcessString:="*"
											//Just the return value  the method namea and the amount of memory default the the procuess name
											If ($_t_Command="EXECUTE ON SERVER")
												Case of 
													: ($_at_2DParameters>=5)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;*)
															
														Else 
															$_l_NewProcessID:=Execute on server:C373($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->)
														End if 
													: ($_at_2DParameters>=6)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=Execute on server:C373($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->)
															
															//
														Else 
															$_l_NewProcessID:=Execute on server:C373($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->)
															
														End if 
													: ($_at_2DParameters>=8)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter3->)
														Else 
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->)
														End if 
													: ($_at_2DParameters>=9)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->)
														Else 
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->)
														End if 
													: ($_at_2DParameters>=10)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->)
														Else 
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->)
														End if 
													: ($_at_2DParameters>=11)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->)
														Else 
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->)
														End if 
													: ($_at_2DParameters>=12)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->)
														Else 
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->)
														End if 
													: ($_at_2DParameters>=13)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->)
														Else 
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->)
														End if 
													: ($_at_2DParameters>=14)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->)
														Else 
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->)
														End if 
													: ($_at_2DParameters>=15)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->)
														Else 
															// /$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->)
														End if 
													: ($_at_2DParameters>=16)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->)
														Else 
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->)
														End if 
													: ($_at_2DParameters>=17)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->)
														Else 
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->)
														End if 
													: ($_at_2DParameters>=18)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->;$_ptr_Parameter13->)
														Else 
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->;$_ptr_Parameter13->)
														End if 
													: ($_at_2DParameters>=19)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->;$_ptr_Parameter13->;$_ptr_Parameter14->)
														Else 
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->;$_ptr_Parameter13->;$_ptr_Parameter14->)
															
															
														End if 
													: ($_at_2DParameters>=20)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->;$_ptr_Parameter13->;$_ptr_Parameter14->;$_ptr_Parameter15->)
														Else 
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->;$_ptr_Parameter13->;$_ptr_Parameter14->;$_ptr_Parameter15->)
															
															
														End if 
													: ($_at_2DParameters>=21)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->;$_ptr_Parameter13->;$_ptr_Parameter14->;$_ptr_Parameter15->;$_ptr_Parameter16->)
														Else 
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->;$_ptr_Parameter13->;$_ptr_Parameter14->;$_ptr_Parameter15->;$_ptr_Parameter16->)
															
															
														End if 
													: ($_at_2DParameters>=22)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->;$_ptr_Parameter13->;$_ptr_Parameter14->;$_ptr_Parameter15->;$_ptr_Parameter16->;$_ptr_Parameter17->)
														Else 
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->;$_ptr_Parameter13->;$_ptr_Parameter14->;$_ptr_Parameter15->;$_ptr_Parameter16->;$_ptr_Parameter17->)
															
															
														End if 
													: ($_at_2DParameters>=23)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->;$_ptr_Parameter13->;$_ptr_Parameter14->;$_ptr_Parameter15->;$_ptr_Parameter16->;$_ptr_Parameter17->;$_ptr_Parameter18->)
														Else 
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->;$_ptr_Parameter13->;$_ptr_Parameter14->;$_ptr_Parameter15->;$_ptr_Parameter16->;$_ptr_Parameter17->;$_ptr_Parameter18->)
															
															
														End if 
													: ($_at_2DParameters>=24)
														If ($_bo_UniqueProcess)
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->;$_ptr_Parameter13->;$_ptr_Parameter14->;$_ptr_Parameter15->;$_ptr_Parameter16->;$_ptr_Parameter17->;$_ptr_Parameter18->;$_ptr_Parameter19->)
														Else 
															//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->;$_ptr_Parameter13->;$_ptr_Parameter14->;$_ptr_Parameter15->;$_ptr_Parameter16->;$_ptr_Parameter17->;$_ptr_Parameter18->;$_ptr_Parameter19->)
															
															
														End if 
														//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->;$_ptr_Parameter13->;$_ptr_Parameter14->;$_ptr_Parameter15->;$_ptr_Parameter16->;$_ptr_Parameter17->;$_ptr_Parameter18->;$_ptr_Parameter19->;$_ptr_Parameter20->;$_ptr_Parameter21->;$_ptr_Parameter22->;$_ptr_Parameter23->)
														//$_l_NewProcessID:=Execute on server($_t_MethodName;$_l_MemoryStack;$_t_ProcessName;$_ptr_Parameter1->;$_ptr_Parameter2->;$_ptr_Parameter3->;$_ptr_Parameter4->;$_ptr_Parameter5->;$_ptr_Parameter6->;$_ptr_Parameter7->;$_ptr_Parameter8->;$_ptr_Parameter9->;$_ptr_Parameter10->;$_ptr_Parameter11->;$_ptr_Parameter12->;$_ptr_Parameter13->;$_ptr_Parameter14->;$_ptr_Parameter15->;$_ptr_Parameter16->;$_ptr_Parameter17->;$_ptr_Parameter18->;$_ptr_Parameter19->;$_ptr_Parameter20->;$_ptr_Parameter21->;$_ptr_Parameter22->;$_ptr_Parameter23->)
														
												End case 
											Else 
												Case of 
													: ($_at_2DParameters>=5)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->)
														End if 
													: ($_at_2DParameters>=6)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->)
														End if 
													: ($_at_2DParameters>=8)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->)
														End if 
													: ($_at_2DParameters>=9)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->)
														End if 
													: ($_at_2DParameters>=10)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->)
														End if 
													: ($_at_2DParameters>=11)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->)
														End if 
													: ($_at_2DParameters>=12)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->)
														End if 
													: ($_at_2DParameters>=13)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->)
														End if 
													: ($_at_2DParameters>=14)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->)
														End if 
													: ($_at_2DParameters>=15)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->)
														End if 
													: ($_at_2DParameters>=16)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->)
														End if 
													: ($_at_2DParameters>=17)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; $_ptr_Parameter12->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; $_ptr_Parameter12->)
														End if 
													: ($_at_2DParameters>=18)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; $_ptr_Parameter12->; $_ptr_Parameter13->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; $_ptr_Parameter12->; $_ptr_Parameter13->)
														End if 
													: ($_at_2DParameters>=19)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; $_ptr_Parameter12->; $_ptr_Parameter13->; $_ptr_Parameter14->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; $_ptr_Parameter12->; $_ptr_Parameter13->; $_ptr_Parameter14->)
															
															
														End if 
													: ($_at_2DParameters>=20)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; $_ptr_Parameter12->; $_ptr_Parameter13->; $_ptr_Parameter14->; $_ptr_Parameter15->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; $_ptr_Parameter12->; $_ptr_Parameter13->; $_ptr_Parameter14->; $_ptr_Parameter15->)
															
															
														End if 
													: ($_at_2DParameters>=21)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; $_ptr_Parameter12->; $_ptr_Parameter13->; $_ptr_Parameter14->; $_ptr_Parameter15->; $_ptr_Parameter16->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; $_ptr_Parameter12->; $_ptr_Parameter13->; $_ptr_Parameter14->; $_ptr_Parameter15->; $_ptr_Parameter16->)
															
															
														End if 
													: ($_at_2DParameters>=22)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; $_ptr_Parameter12->; $_ptr_Parameter13->; $_ptr_Parameter14->; $_ptr_Parameter15->; $_ptr_Parameter16->; $_ptr_Parameter17->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; $_ptr_Parameter12->; $_ptr_Parameter13->; $_ptr_Parameter14->; $_ptr_Parameter15->; $_ptr_Parameter16->; $_ptr_Parameter17->)
															
															
														End if 
													: ($_at_2DParameters>=23)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; $_ptr_Parameter12->; $_ptr_Parameter13->; $_ptr_Parameter14->; $_ptr_Parameter15->; $_ptr_Parameter16->; $_ptr_Parameter17->; $_ptr_Parameter18->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; $_ptr_Parameter12->; $_ptr_Parameter13->; $_ptr_Parameter14->; $_ptr_Parameter15->; $_ptr_Parameter16->; $_ptr_Parameter17->; $_ptr_Parameter18->)
															
															
														End if 
													: ($_at_2DParameters>=24)
														If ($_bo_UniqueProcess)
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; $_ptr_Parameter12->; $_ptr_Parameter13->; $_ptr_Parameter14->; $_ptr_Parameter15->; $_ptr_Parameter16->; $_ptr_Parameter17->; $_ptr_Parameter18->; $_ptr_Parameter19->; *)
														Else 
															$_l_NewProcessID:=New process:C317($_t_MethodName; $_l_MemoryStack; $_t_ProcessName; $_ptr_Parameter1->; $_ptr_Parameter2->; $_ptr_Parameter3->; $_ptr_Parameter4->; $_ptr_Parameter5->; $_ptr_Parameter6->; $_ptr_Parameter7->; $_ptr_Parameter8->; $_ptr_Parameter9->; $_ptr_Parameter10->; $_ptr_Parameter11->; $_ptr_Parameter12->; $_ptr_Parameter13->; $_ptr_Parameter14->; $_ptr_Parameter15->; $_ptr_Parameter16->; $_ptr_Parameter17->; $_ptr_Parameter18->; $_ptr_Parameter19->)
															
															
														End if 
												End case 
											End if 
											$_ptr_ReturnVariable:=Get pointer:C304($_t_ProcessIDString)
											$_ptr_ReturnVariable->:=$_l_NewProcessID
										End if 
										
										
										
								End case 
							End if 
						End if 
						If (False:C215)
							$_l_CharacterPosition:=Position:C15(":="; $_t_ThisLine)
							If ($_l_CharacterPosition>0)  // it should be! as we checked it before
								
								$_t_ProcessVariable:=Substring:C12($_t_ThisLine; 1; $_l_CharacterPosition-1)
								$_l_CharacterPosition:=Position:C15("NEW PROCESS"; $_t_ThisLine)
								$_l_StringLength:=Length:C16("NEW PROCESS")
								$_bo_ExecuteOnServer:=False:C215
								If ($_l_CharacterPosition=0)
									$_l_CharacterPosition:=Position:C15("EXECUTE ON SERVER"; $_t_ThisLine)
									$_l_StringLength:=Length:C16("EXECUTE ON SERVER")
									$_bo_ExecuteOnServer:=True:C214
								End if 
								If ($_l_CharacterPosition>0)
									$_t_ProcessCommands:=Substring:C12($_t_ThisLine; $_l_CharacterPosition+$_l_StringLength+1)
									If ($_t_ProcessCommands#"")
										//other wise line is rubbish
										$_l_OpenBracketPosition:=Position:C15("("; $_t_ProcessCommands)
										If ($_l_OpenBracketPosition>0)
											$_t_ProcessCommands:=Substring:C12($_t_ProcessCommands; $_l_OpenBracketPosition)
											$_l_SemiColonPosition:=Position:C15(";"; $_t_ProcessCommands)
											If ($_l_SemiColonPosition>0)
												$_t_MethodName:=Substring:C12($_t_ProcessCommands; 1; $_l_SemiColonPosition-1)
												
												If ($_t_MethodName#"")
													$_t_ProcessCommands:=Substring:C12($_t_ProcessCommands; $_l_SemiColonPosition+1)
													$_l_SemiColonPosition:=Position:C15(";"; $_t_ProcessCommands)
													If ($_l_SemiColonPosition>0)
														$_l_Memory:=Num:C11(Substring:C12($_t_ProcessCommands; 1; $_l_SemiColonPosition-1))
														If ($_l_Memory=0)
															$_l_Memory:=DB_ProcessMemoryinit(4)
														End if 
														$_t_ProcessCommands:=Substring:C12($_t_ProcessCommands; $_l_SemiColonPosition+1; Length:C16($_t_ProcessCommands))
														$_l_EndBracketPosition:=Length:C16($_t_ProcessCommands)
														Repeat 
															$_t_ThisCharacter:=$_t_ProcessCommands[[$_l_EndBracketPosition]]
															$_l_EndBracketPosition:=$_l_EndBracketPosition-1
														Until ($_t_ThisCharacter=")") | ($_l_CharacterPosition=0)
														If ($_l_EndBracketPosition>0)
															$_t_ProcessName:=Substring:C12($_t_ProcessCommands; 1; $_l_EndBracketPosition)
															//$_t_ProcessName may contain extra parameters but the will be fine...
															If ($_t_ProcessName="")
																$_t_ProcessName:="PROCESS"
															End if 
															If ($_bo_ExecuteOnServer=False:C215)
																$_l_ProcessNumber:=New process:C317($_t_MethodName; $_l_Memory; $_t_ProcessName)
																//EXECUTE("$_t_ProcessVariable:=$_l_ProcessNumber")
															Else 
																$_l_ProcessNumber:=Execute on server:C373($_t_MethodName; $_l_Memory; $_t_ProcessName)
																//EXECUTE("$_t_ProcessVariable:=$_l_ProcessNumber")
															End if 
															
														End if 
														
													End if 
												End if 
												
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					Else 
						If (($_t_ThisLine#"") & ($_t_ThisLine#"`@"))
							If ($_t_ThisLine="@◊aMod{@") | ($_t_ThisLine="@<>Mod_al_ModuleAccessType{@")
								Gen_Alert("You are not allowed to Execute a statement containing the ◊aMod array"; "Sorry")
							Else 
								If (($_t_ThisLine="Macro@") | ($_t_ThisLine="@Macro_Result@"))
									$MAC_l_MessageWindow:=MAC_l_MessageWindow
									EXECUTE FORMULA:C63($_t_ThisLine)
									MAC_l_MessageWindow:=$MAC_l_MessageWindow
								Else 
									If (Position:C15("QUERY SELECTION"; $_t_ThisLine)>0)
										$_l_CommandPosition:=Position:C15("QUERY SELECTION BY FORMULA"; $_t_ThisLine)
										If ($_l_CommandPosition=0)
											$_l_CommandPosition:=Position:C15("QUERY SELECTION WITH ARRAY"; $_t_ThisLine)
											If ($_l_CommandPosition=0)
												$_l_CommandPosition:=Position:C15("QUERY SELECTION"; $_t_ThisLine)
												$_t_TableNamewithBrackets:=Substring:C12($_t_ThisLine; $_l_CommandPosition+Length:C16("QUERY SELECTION"))
											Else 
												$_t_TableNamewithBrackets:=Substring:C12($_t_ThisLine; $_l_CommandPosition+Length:C16("QUERY SELECTION WITH ARRAY"))
											End if 
										Else 
											$_t_TableNamewithBrackets:=Substring:C12($_t_ThisLine; $_l_CommandPosition+Length:C16("QUERY SELECTION BY FORMULA"))
										End if 
										$_l_EndBraketPosition:=Position:C15("]"; $_t_TableNamewithBrackets)
										$_t_TableNamewithBrackets:=Substring:C12($_t_TableNamewithBrackets; 2; $_l_EndBraketPosition-1)
										MESSAGES OFF:C175
										EXECUTE FORMULA:C63("MAC_ptr_FilePointer:=->"+$_t_TableNamewithBrackets)
										If (Records in selection:C76(MAC_ptr_FilePointer->)>0)
											EXECUTE FORMULA:C63($_t_ThisLine)
										End if 
									Else 
										MESSAGES OFF:C175
										
										EXECUTE FORMULA:C63($_t_ThisLine)
										
									End if 
									
									//End if
								End if 
							End if 
						End if 
				End case 
				
			Else 
				If (Size of array:C274($2->{$_l_Execute})>1)
					//Gather the sub macro...lines
					//TRACE
					
					$_l_LastLine:=0
					
					For ($_l_endStatementIndex; $_l_Execute+1; Size of array:C274($2->))
						If ($2->{$_l_endStatementIndex}{1}#"")
							$_l_LastLine:=$_l_endStatementIndex-1
							$_l_endStatementIndex:=Size of array:C274($2->)
						End if 
					End for 
					If ($_l_LastLine>0) & ($_l_LastLine>=$_l_Execute)
						
						$_l_Execute:=$_l_LastLine
					Else 
						//$_l_Execute:=Size of array($2->)
						
					End if 
					
				End if 
				
			End if 
			If (SCPT_l_Cancel=0)
				SCPT_l_Cancel:=<>SYS_l_CancelProcess
				<>SYS_l_CancelProcess:=0
			End if 
			If (SCPT_l_Cancel=Current process:C322)
				$_bo_noStop:=False:C215
			End if 
		Else 
			$_bo_noStop:=False:C215
			$_l_Execute:=Size of array:C274($2->)
		End if 
	End for 
End if 
If ($_t_MethodCalledOnError#"")
	ON ERR CALL:C155($_t_MethodCalledOnError)
End if 
ERR_MethodTrackerReturn("Macro_Play"; $_t_oldMethodName)
