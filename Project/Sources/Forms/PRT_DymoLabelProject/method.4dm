If (False:C215)
	//Project Form Method Name: PRT_DymoLabelProject
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/10/2013 05:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRT_lb_ListboxPrintObjects;0)
	//ARRAY LONGINT(PRT_al_DateFormat;0)
	//ARRAY LONGINT(Prt_al_labelobjectFontsize;0)
	//ARRAY LONGINT(Prt_al_labelobjectFontStyle;0)
	//ARRAY LONGINT(Prt_al_labelobjectFramecolour;0)
	//ARRAY LONGINT(Prt_al_labelobjectFrameOption;0)
	//ARRAY LONGINT(Prt_al_labelobjectFrameWidth;0)
	//ARRAY LONGINT(Prt_al_LabelobjectHeight;0)
	//ARRAY LONGINT(Prt_al_labelobjectLeftPos;0)
	//ARRAY LONGINT(Prt_al_LabelobjectTopPos;0)
	//ARRAY LONGINT(Prt_al_LabelobjectWidth;0)
	//ARRAY LONGINT(PRT_al_LabelProject;0)
	//ARRAY TEXT(PRT_at_Alignment;0)
	//ARRAY TEXT(PRT_at_DateFormat;0)
	//ARRAY TEXT(PRT_at_DymoDocTemplates;0)
	//ARRAY TEXT(PRT_at_FontStyles;0)
	//ARRAY TEXT(Prt_at_FrameOptions;0)
	//ARRAY TEXT(PRT_at_ItemColors;0)
	//ARRAY TEXT(PRT_at_ItemFonts;0)
	//ARRAY TEXT(PRT_at_ItemTypes;0)
	//ARRAY TEXT(Prt_at_LabelobjectAlignment;0)
	//ARRAY TEXT(Prt_at_LabelObjectFont;0)
	//ARRAY TEXT(Prt_at_labelobjectFontStyle;0)
	//ARRAY TEXT(Prt_at_labelobjectFramecolour;0)
	//ARRAY TEXT(Prt_at_labelobjectFrameOption;0)
	//ARRAY TEXT(PRT_At_LabelObjects;0)
	//ARRAY TEXT(PRT_at_LabelObjectType;0)
	//ARRAY TEXT(PRT_at_LabelTemplate;0)
	//ARRAY TEXT(PRT_at_PrintOrientation;0)
	//ARRAY TEXT(PRT_at_PrintTrayOptions;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; PRT_bo_IncludeCount; PRT_bo_IncludeDateTime; PRT_bo_IncludeTime; PRT_bo_TwentyFour)
	C_LONGINT:C283(<>TextSize; $_l_event; $_l_Index; $_l_PreferenceID; $_l_TemplateRow; PRT_l_BUT1; PRT_l_BUT10; PRT_l_BUT11; PRT_l_BUT12; PRT_l_BUT13; PRT_l_BUT14)
	C_LONGINT:C283(PRT_l_BUT15; PRT_l_BUT16; PRT_l_BUT17; PRT_l_BUT18; PRT_l_BUT19; PRT_l_BUT2; PRT_l_BUT20; PRT_l_BUT21; PRT_l_BUT22; PRT_l_BUT23; PRT_l_BUT24)
	C_LONGINT:C283(PRT_l_BUT25; PRT_l_BUT26; PRT_l_BUT27; PRT_l_BUT3; PRT_l_BUT4; PRT_l_BUT5; PRT_l_BUT6; PRT_l_BUT7; PRT_l_BUT8; PRT_l_BUT9; PRT_l_CounterIncrementValue)
	C_LONGINT:C283(PRT_l_CounterLeadingZeros; PRT_l_CounterobjectLeft; PRT_l_CounterobjectTop; PRT_l_CounterobjectWidth; PRT_l_CounterStartingValue; PRT_l_DateLeft; PRT_l_DateTop; PRT_l_DateWidth; PRT_l_NumberofCopies)
	C_TEXT:C284(<>FormFont; $_t_oldMethodName; oPRT_COL1; oPRT_COL10; oPRT_COL11; oPRT_COL12; oPRT_COL13; oPRT_COL14; oPRT_COL15; oPRT_COL16; oPRT_COL17)
	C_TEXT:C284(oPRT_COL18; oPRT_COL19; oPRT_COL2; oPRT_COL20; oPRT_COL21; oPRT_COL22; oPRT_COL23; oPRT_COL24; oPRT_COL25; oPRT_COL26; oPRT_COL27)
	C_TEXT:C284(oPRT_COL3; oPRT_COL4; oPRT_COL5; oPRT_COL6; oPRT_COL7; oPRT_COL8; oPRT_COL9; oPRT_HED1; oPRT_HED10; oPRT_HED11; oPRT_HED12)
	C_TEXT:C284(oPRT_HED13; oPRT_HED14; oPRT_HED15; oPRT_HED16; oPRT_HED17; oPRT_HED18; oPRT_HED19; oPRT_HED2; oPRT_HED20; oPRT_HED21; oPRT_HED22)
	C_TEXT:C284(oPRT_HED23; oPRT_HED24; oPRT_HED25; oPRT_HED26; oPRT_HED27; oPRT_HED3; oPRT_HED4; oPRT_HED5; oPRT_HED6; oPRT_HED7; oPRT_HED8)
	C_TEXT:C284(oPRT_HED9; PRT_T_CalcuateNumberofCopies; PRT_T_CounterAfter; PRT_T_CounterBefore; PRT_T_CounterFormula; PRT_T_DateAfter; PRT_T_DateBefore; PRT_T_DateFormat; PRT_t_LabelTemplate; Prt_t_LabelTray; PRT_t_PrintOrientation)
	C_TEXT:C284(PRT_t_SetupName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRT_DymoLabelProject"; Form event code:C388)




$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		ARRAY TEXT:C222(PRT_at_ItemTypes; 2)
		PRT_at_ItemTypes{1}:="Text"
		//PRT_at_ItemTypes{2}:="Address"
		PRT_at_ItemTypes{2}:="Image"
		//PRT_at_ItemTypes{4}:="Barcode"
		ARRAY TEXT:C222(PRT_at_ItemFonts; 0)
		FONT LIST:C460(PRT_at_ItemFonts)
		ARRAY TEXT:C222(PRT_at_FontStyles; 0)
		ARRAY TEXT:C222(PRT_at_Alignment; 0)
		
		
		APPEND TO ARRAY:C911(PRT_at_FontStyles; "Normal")
		APPEND TO ARRAY:C911(PRT_at_FontStyles; "Bold")
		APPEND TO ARRAY:C911(PRT_at_FontStyles; "Italic")
		APPEND TO ARRAY:C911(PRT_at_FontStyles; "Bold Italic")
		APPEND TO ARRAY:C911(PRT_at_FontStyles; "Underline")
		APPEND TO ARRAY:C911(PRT_at_FontStyles; "Italic Underline")
		APPEND TO ARRAY:C911(PRT_at_FontStyles; "Bold Underline")
		APPEND TO ARRAY:C911(PRT_at_FontStyles; "Italic bold Underline ")
		ARRAY TEXT:C222(PRT_at_ItemColors; 0)
		APPEND TO ARRAY:C911(PRT_at_ItemColors; "Black")
		APPEND TO ARRAY:C911(PRT_at_ItemColors; "Grey")
		APPEND TO ARRAY:C911(PRT_at_ItemColors; "Light Grey")
		ARRAY TEXT:C222(Prt_at_FrameOptions; 0)
		APPEND TO ARRAY:C911(Prt_at_FrameOptions; "No Frame")  //0
		APPEND TO ARRAY:C911(Prt_at_FrameOptions; "Under section")  //1
		APPEND TO ARRAY:C911(Prt_at_FrameOptions; "Over section")  //2
		APPEND TO ARRAY:C911(Prt_at_FrameOptions; "Over and Under section")  //3
		APPEND TO ARRAY:C911(Prt_at_FrameOptions; "Left of section")  //4
		APPEND TO ARRAY:C911(Prt_at_FrameOptions; "Left of and under section")  //5
		APPEND TO ARRAY:C911(Prt_at_FrameOptions; "Left of and over section")  //6
		APPEND TO ARRAY:C911(Prt_at_FrameOptions; "Left of and over and under section")  //7
		APPEND TO ARRAY:C911(Prt_at_FrameOptions; "Right of section")  //8
		APPEND TO ARRAY:C911(Prt_at_FrameOptions; "Right of and under section")  //9
		APPEND TO ARRAY:C911(Prt_at_FrameOptions; "Right of and over section")  //10
		APPEND TO ARRAY:C911(Prt_at_FrameOptions; "Right of and over and under section")  //11
		APPEND TO ARRAY:C911(Prt_at_FrameOptions; "Left of a right of section")  //12
		APPEND TO ARRAY:C911(Prt_at_FrameOptions; "Left of a right of and under section")  //13
		APPEND TO ARRAY:C911(Prt_at_FrameOptions; "Left of a right of and over section")  //14
		APPEND TO ARRAY:C911(Prt_at_FrameOptions; "Left of a right of and over and under section")  //15
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		APPEND TO ARRAY:C911(PRT_at_Alignment; "Left")
		APPEND TO ARRAY:C911(PRT_at_Alignment; "Center")
		APPEND TO ARRAY:C911(PRT_at_Alignment; "Right")
		
		
		
		
		
		//TRACE
		$_l_PreferenceID:=PREF_GetPreferenceID("Dymo Label Settings")
		
		
		ARRAY TEXT:C222(PRT_at_LabelTemplate; 0)
		
		PRT_t_LabelTemplate:=""
		ARRAY TEXT:C222(PRT_at_PrintTrayOptions; 0)
		
		Prt_t_LabelTray:=""
		
		ARRAY TEXT:C222(PRT_at_PrintOrientation; 0)
		PRT_t_PrintOrientation:=""
		
		PRT_l_NumberofCopies:=0
		
		PRT_T_CalcuateNumberofCopies:=""
		
		PRT_bo_IncludeCount:=False:C215
		
		PRT_T_CounterFormula:=""
		
		PRT_T_CounterBefore:=""
		
		PRT_T_CounterAfter:=""
		
		PRT_l_CounterobjectLeft:=0
		
		PRT_l_CounterobjectTop:=0
		
		PRT_l_CounterobjectWidth:=0
		
		
		
		PRT_l_CounterLeadingZeros:=0
		
		PRT_l_CounterobjectWidth:=0
		
		PRT_l_CounterStartingValue:=0
		
		PRT_l_CounterIncrementValue:=0
		
		OBJECT SET ENTERABLE:C238(*; "oCounter@"; False:C215)
		
		
		PRT_bo_IncludeDateTime:=False:C215
		
		PRT_bo_IncludeTime:=False:C215
		
		PRT_bo_TwentyFour:=False:C215
		
		PRT_T_DateBefore:=""
		
		PRT_T_DateAfter:=""
		
		PRT_l_DateLeft:=0
		
		PRT_l_DateTop:=0
		
		PRT_l_DateWidth:=0
		
		
		ARRAY TEXT:C222(PRT_at_DateFormat; 0)
		ARRAY LONGINT:C221(PRT_al_DateFormat; 0)
		PRT_T_DateFormat:=""
		
		
		OBJECT SET ENTERABLE:C238(*; "oDateTime@"; False:C215)
		OBJECT SET ENABLED:C1123(PRT_bo_TwentyFour; False:C215)
		OBJECT SET ENABLED:C1123(PRT_at_DateFormat; False:C215)
		OBJECT SET ENABLED:C1123(PRT_bo_IncludeTime; False:C215)
		
		
		
		ARRAY TEXT:C222(PRT_At_LabelObjects; 0)
		ARRAY TEXT:C222(PRT_at_LabelObjectType; 0)
		ARRAY TEXT:C222(Prt_at_LabelObjectFont; 0)
		ARRAY LONGINT:C221(Prt_al_labelobjectFontsize; 0)
		ARRAY LONGINT:C221(Prt_al_labelobjectFontStyle; 0)
		ARRAY LONGINT:C221(Prt_al_labelobjectFrameOption; 0)
		
		
		//0 none  //
		// 1 under
		//2 over
		//(3=over and under)
		//4 left
		//(5=Left  and under)
		//(6=left and over)
		//(7=left and over and under)
		//8 right
		//(9= right and under)
		//(10=right and over)
		//(11=right and over and under)
		//(12=Right and left)
		//(13)=right and left and under
		//(14=right and left and over)
		//(15=right and left and over and under)
		
		ARRAY LONGINT:C221(Prt_al_labelobjectFrameWidth; 0)
		ARRAY LONGINT:C221(Prt_al_labelobjectFramecolour; 0)
		ARRAY LONGINT:C221(Prt_al_labelobjectLeftPos; 0)
		ARRAY LONGINT:C221(Prt_al_LabelobjectTopPos; 0)
		ARRAY LONGINT:C221(Prt_al_LabelobjectWidth; 0)
		ARRAY LONGINT:C221(Prt_al_LabelobjectHeight; 0)
		ARRAY TEXT:C222(Prt_at_LabelobjectAlignment; 0)
		
		
		
		//```
		ARRAY TEXT:C222(PRT_at_PrintTrayOptions; 3)
		PRT_at_PrintTrayOptions{1}:="Left"
		PRT_at_PrintTrayOptions{2}:="Right"
		PRT_at_PrintTrayOptions{3}:="Ask"
		
		If (PRT_al_LabelProject>0)
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID; *)
			QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3=-PRT_al_LabelProject)
			
			If (Records in selection:C76([PREFERENCES:116])=1)
				PRT_ManageDymoSettings
			Else 
				//Some defaults
				
			End if 
		Else 
			//TRACE
			Case of 
				: (PRT_t_SetupName="Order Customer Label")
					Prt_t_PrintOrientation:="Normal"
					Prt_l_NumberofCopies:=1
					APPEND TO ARRAY:C911(Prt_At_LabelObjects; "DYMO_GetOrderAddress")
					APPEND TO ARRAY:C911(Prt_at_LabelObjectType; "Text")
					APPEND TO ARRAY:C911(Prt_at_LabelObjectFont; <>FormFont)
					APPEND TO ARRAY:C911(Prt_al_labelobjectFontsize; <>TextSize)
					APPEND TO ARRAY:C911(Prt_al_labelobjectFontStyle; 0)
					APPEND TO ARRAY:C911(Prt_al_labelobjectFrameOption; 0)
					APPEND TO ARRAY:C911(Prt_al_labelobjectFrameWidth; 0)
					APPEND TO ARRAY:C911(Prt_al_labelobjectFramecolour; 0)
					APPEND TO ARRAY:C911(Prt_al_labelobjectLeftPos; 60)
					APPEND TO ARRAY:C911(Prt_al_LabelobjectTopPos; 6)
					APPEND TO ARRAY:C911(Prt_al_LabelobjectWidth; 200)
					APPEND TO ARRAY:C911(Prt_al_LabelobjectHeight; 80)
				: (PRT_t_SetupName="Order Packing Label")
					Prt_t_PrintOrientation:="Normal"
					Prt_l_NumberofCopies:=1
					APPEND TO ARRAY:C911(Prt_At_LabelObjects; "[ORDER ITEMS]Product Code")
					APPEND TO ARRAY:C911(Prt_at_LabelObjectType; "Text")
					APPEND TO ARRAY:C911(Prt_at_LabelObjectFont; <>FormFont)
					APPEND TO ARRAY:C911(Prt_al_labelobjectFontsize; <>TextSize)
					APPEND TO ARRAY:C911(Prt_al_labelobjectFontStyle; 0)
					APPEND TO ARRAY:C911(Prt_al_labelobjectFrameOption; 0)
					APPEND TO ARRAY:C911(Prt_al_labelobjectFrameWidth; 0)
					APPEND TO ARRAY:C911(Prt_al_labelobjectFramecolour; 0)
					APPEND TO ARRAY:C911(Prt_al_labelobjectLeftPos; 28)
					APPEND TO ARRAY:C911(Prt_al_LabelobjectTopPos; 6)
					APPEND TO ARRAY:C911(Prt_al_LabelobjectWidth; 100)
					APPEND TO ARRAY:C911(Prt_al_LabelobjectHeight; 18)
					APPEND TO ARRAY:C911(Prt_At_LabelObjects; "[ORDER ITEMS]Quantity")
					APPEND TO ARRAY:C911(Prt_at_LabelObjectType; "Text")
					APPEND TO ARRAY:C911(Prt_at_LabelObjectFont; <>FormFont)
					APPEND TO ARRAY:C911(Prt_al_labelobjectFontsize; <>TextSize)
					APPEND TO ARRAY:C911(Prt_al_labelobjectFontStyle; 0)
					APPEND TO ARRAY:C911(Prt_al_labelobjectFrameOption; 0)
					APPEND TO ARRAY:C911(Prt_al_labelobjectFrameWidth; 0)
					APPEND TO ARRAY:C911(Prt_al_labelobjectFramecolour; 0)
					APPEND TO ARRAY:C911(Prt_al_labelobjectLeftPos; 15)
					APPEND TO ARRAY:C911(Prt_al_LabelobjectTopPos; 6)
					APPEND TO ARRAY:C911(Prt_al_LabelobjectWidth; 25)
					APPEND TO ARRAY:C911(Prt_al_LabelobjectHeight; 18)
			End case 
		End if 
		PRT_DymoSelectLabel(False:C215)
		
		COPY ARRAY:C226(PRT_at_DymoDocTemplates; PRT_at_LabelTemplate)
		If (PRT_t_LabelTemplate#"")
			$_l_TemplateRow:=Find in array:C230(PRT_at_LabelTemplate; PRT_t_LabelTemplate)
			If ($_l_TemplateRow>0)
				PRT_at_LabelTemplate:=$_l_TemplateRow
			Else 
				PRT_at_LabelTemplate:=0
			End if 
			
			
		Else 
			PRT_at_LabelTemplate:=0
			
		End if 
		ARRAY TEXT:C222(PRT_at_PrintTrayOptions; 3)
		PRT_at_PrintTrayOptions{1}:="Left"
		PRT_at_PrintTrayOptions{2}:="Right"
		PRT_at_PrintTrayOptions{3}:="Select"
		If (Prt_t_LabelTray#"")
			$_l_TemplateRow:=Find in array:C230(PRT_at_PrintTrayOptions; Prt_t_LabelTray)
			If ($_l_TemplateRow>0)
				PRT_at_PrintTrayOptions:=$_l_TemplateRow
			Else 
				PRT_at_PrintTrayOptions:=0
			End if 
			
		Else 
			PRT_at_PrintTrayOptions:=0
		End if 
		ARRAY TEXT:C222(PRT_at_PrintOrientation; 2)
		PRT_at_PrintOrientation{1}:="Normal"
		PRT_at_PrintOrientation{2}:="Vertical"
		If (PRT_t_PrintOrientation#"")
			$_l_TemplateRow:=Find in array:C230(PRT_at_PrintOrientation; PRT_t_PrintOrientation)
			If ($_l_TemplateRow>0)
				PRT_at_PrintOrientation:=$_l_TemplateRow
			Else 
				PRT_at_PrintOrientation:=0
			End if 
		Else 
			PRT_at_PrintOrientation:=0
		End if 
		If (PRT_bo_IncludeCount)
			OBJECT SET ENTERABLE:C238(*; "oCounter@"; True:C214)
		End if 
		//No clues in the Dymo documentation-had to look at the label editor to work this out
		APPEND TO ARRAY:C911(PRT_at_DateFormat; "Don't include date")
		APPEND TO ARRAY:C911(PRT_at_DateFormat; "Long System date")
		APPEND TO ARRAY:C911(PRT_at_DateFormat; "Day Name, Month Name Date, Long Year")
		APPEND TO ARRAY:C911(PRT_at_DateFormat; "Day Name,Date Month, Long Year")
		APPEND TO ARRAY:C911(PRT_at_DateFormat; "Date Month Name Long Year")
		APPEND TO ARRAY:C911(PRT_at_DateFormat; "Month-Date-Long Year")
		APPEND TO ARRAY:C911(PRT_at_DateFormat; "Date-Month-Long Year")
		APPEND TO ARRAY:C911(PRT_at_DateFormat; "Month-Date-Short Year")
		APPEND TO ARRAY:C911(PRT_at_DateFormat; "Date-Month-Short Year")
		APPEND TO ARRAY:C911(PRT_at_DateFormat; "Month.Date.Long Year")
		APPEND TO ARRAY:C911(PRT_at_DateFormat; "Date.Month.Long Year")
		APPEND TO ARRAY:C911(PRT_at_DateFormat; "Long Year-Month-Date")
		APPEND TO ARRAY:C911(PRT_at_DateFormat; "Long Year-Date-Month")
		APPEND TO ARRAY:C911(PRT_at_DateFormat; "Date-Month Name-Long Year")
		APPEND TO ARRAY:C911(PRT_at_DateFormat; "Month Name-Date-Long Year")
		
		
		
		If (PRT_T_DateFormat#"")
			$_l_TemplateRow:=Find in array:C230(PRT_at_DateFormat; PRT_T_DateFormat)
			If ($_l_TemplateRow>0)
				PRT_at_DateFormat:=$_l_TemplateRow
			Else 
				PRT_at_DateFormat:=0
			End if 
		Else 
			PRT_at_DateFormat:=0
		End if 
		If (PRT_bo_IncludeDateTime)
			OBJECT SET ENTERABLE:C238(*; "oDateTime@"; True:C214)
			OBJECT SET ENABLED:C1123(PRT_bo_TwentyFour; True:C214)
			OBJECT SET ENABLED:C1123(PRT_at_DateFormat; True:C214)
			OBJECT SET ENABLED:C1123(PRT_bo_IncludeTime; True:C214)
			
		End if 
		
		
		
		
		
		
		ARRAY TEXT:C222(Prt_at_labelobjectFrameOption; Size of array:C274(Prt_al_labelobjectFrameOption))
		For ($_l_Index; 1; Size of array:C274(Prt_at_labelobjectFrameOption))
			Case of 
				: (Prt_al_labelobjectFrameOption{$_l_Index}=0)
					Prt_at_labelobjectFrameOption{$_l_Index}:="No Frame"
				: (Prt_al_labelobjectFrameOption{$_l_Index}=1)
					Prt_at_labelobjectFrameOption{$_l_Index}:="Under section"
				: (Prt_al_labelobjectFrameOption{$_l_Index}=2)
					Prt_at_labelobjectFrameOption{$_l_Index}:="Over section"
				: (Prt_al_labelobjectFrameOption{$_l_Index}=3)
					Prt_at_labelobjectFrameOption{$_l_Index}:="Over and Under section"
				: (Prt_al_labelobjectFrameOption{$_l_Index}=4)
					Prt_at_labelobjectFrameOption{$_l_Index}:="Left of section"
				: (Prt_al_labelobjectFrameOption{$_l_Index}=5)
					Prt_at_labelobjectFrameOption{$_l_Index}:="Left of and under section"
				: (Prt_al_labelobjectFrameOption{$_l_Index}=6)
					Prt_at_labelobjectFrameOption{$_l_Index}:="Left of and over section"
				: (Prt_al_labelobjectFrameOption{$_l_Index}=7)
					Prt_at_labelobjectFrameOption{$_l_Index}:="Left of and over and under section"
				: (Prt_al_labelobjectFrameOption{$_l_Index}=8)
					Prt_at_labelobjectFrameOption{$_l_Index}:="Right of section"
				: (Prt_al_labelobjectFrameOption{$_l_Index}=9)
					Prt_at_labelobjectFrameOption{$_l_Index}:="Right of and under section"
				: (Prt_al_labelobjectFrameOption{$_l_Index}=10)
					Prt_at_labelobjectFrameOption{$_l_Index}:="Right of and over section"
				: (Prt_al_labelobjectFrameOption{$_l_Index}=11)
					Prt_at_labelobjectFrameOption{$_l_Index}:="Right of and over and under section"
				: (Prt_al_labelobjectFrameOption{$_l_Index}=12)
					Prt_at_labelobjectFrameOption{$_l_Index}:="Left of a right of section"
				: (Prt_al_labelobjectFrameOption{$_l_Index}=13)
					Prt_at_labelobjectFrameOption{$_l_Index}:="Left of a right of and under section"
				: (Prt_al_labelobjectFrameOption{$_l_Index}=14)
					Prt_at_labelobjectFrameOption{$_l_Index}:="Left of a right of and over section"
				: (Prt_al_labelobjectFrameOption{$_l_Index}=15)
					Prt_at_labelobjectFrameOption{$_l_Index}:="Left of a right of and over and under section"
				: (Prt_al_labelobjectFrameOption{$_l_Index}=16)
					Prt_at_labelobjectFrameOption{$_l_Index}:="UNKNOWN"
					
					
			End case 
		End for 
		ARRAY TEXT:C222(Prt_at_labelobjectFontStyle; Size of array:C274(Prt_al_labelobjectFontStyle))
		For ($_l_Index; 1; Size of array:C274(Prt_at_labelobjectFontStyle))
			Case of 
				: (Prt_al_labelobjectFontStyle{$_l_Index}=Plain:K14:1)
					
					Prt_at_labelobjectFontStyle{$_l_Index}:=PRT_at_FontStyles{1}
				: (Prt_al_labelobjectFontStyle{$_l_Index}=Bold:K14:2)
					
					Prt_at_labelobjectFontStyle{$_l_Index}:=PRT_at_FontStyles{2}
				: (Prt_al_labelobjectFontStyle{$_l_Index}=Italic:K14:3)
					
					Prt_at_labelobjectFontStyle{$_l_Index}:=PRT_at_FontStyles{3}
				: (Prt_al_labelobjectFontStyle{$_l_Index}=Italic:K14:3+Bold:K14:2)
					
					Prt_at_labelobjectFontStyle{$_l_Index}:=PRT_at_FontStyles{4}
				: (Prt_al_labelobjectFontStyle{$_l_Index}=Underline:K14:4)
					
					Prt_at_labelobjectFontStyle{$_l_Index}:=PRT_at_FontStyles{5}
				: (Prt_al_labelobjectFontStyle{$_l_Index}=Underline:K14:4+Italic:K14:3)
					
					Prt_at_labelobjectFontStyle{$_l_Index}:=PRT_at_FontStyles{6}
				: (Prt_al_labelobjectFontStyle{$_l_Index}=Underline:K14:4+Bold:K14:2)
					
					Prt_at_labelobjectFontStyle{$_l_Index}:=PRT_at_FontStyles{7}
				: (Prt_al_labelobjectFontStyle{$_l_Index}=Underline:K14:4+Bold:K14:2+Italic:K14:3)
					
					Prt_at_labelobjectFontStyle{$_l_Index}:=PRT_at_FontStyles{8}
			End case 
		End for 
		ARRAY TEXT:C222(Prt_at_labelobjectFramecolour; Size of array:C274(Prt_al_labelobjectFramecolour))
		For ($_l_Index; 1; Size of array:C274(Prt_at_labelobjectFramecolour))
			Case of 
				: (Prt_al_labelobjectFramecolour{$_l_Index}=Black:K11:16)
					
					Prt_at_labelobjectFramecolour{$_l_Index}:="Black"
				: (Prt_al_labelobjectFramecolour{$_l_Index}=Grey:K11:15)
					
					Prt_at_labelobjectFramecolour{$_l_Index}:="Grey"
				: (Prt_al_labelobjectFramecolour{$_l_Index}=Light grey:K11:13)
					
					Prt_at_labelobjectFramecolour{$_l_Index}:="Light grey"
					
			End case 
		End for 
		
		
		
		
		
		
		LB_SetupListbox(->PRT_lb_ListboxPrintObjects; "oPRT"; "PRT_L"; 1; ->PRT_At_LabelObjects; ->PRT_at_LabelObjectType; ->Prt_at_LabelObjectFont; ->Prt_al_labelobjectFontsize; ->Prt_at_labelobjectFontStyle; ->Prt_at_LabelobjectAlignment; ->Prt_at_labelobjectFrameOption; ->Prt_al_labelobjectFrameWidth; ->Prt_at_labelobjectFramecolour; ->Prt_al_labelobjectLeftPos; ->Prt_al_LabelobjectTopPos; ->Prt_al_LabelobjectWidth; ->Prt_al_LabelobjectHeight; ->Prt_al_labelobjectFontStyle; ->Prt_al_labelobjectFramecolour; ->Prt_al_labelobjectFrameOption)
		
		
		
		
		
		
		
		
		
		LB_SetColumnHeaders(->PRT_lb_ListboxPrintObjects; "PRT_L"; 1; "Item"; "Item Type"; "Font"; "Font Size"; "Style"; "Alignment"; "Frame"; "Frame thickness"; "Color"; "item left position"; "item top position"; "Item width"; "Item height")
		
		
		LB_SetColumnWidths(->PRT_lb_ListboxPrintObjects; "oPRT"; 1; 100; 100; 100; 88; 100; 100; 0; 0; 0; 88; 88; 88; 88; 0; 0; 0)
		
		LB_SetEnterable(->PRT_lb_ListboxPrintObjects; False:C215; 0)
		
		LB_SetScroll(->PRT_lb_ListboxPrintObjects; -2; -2)
		LB_StyleSettings(->PRT_lb_ListboxPrintObjects; "Black"; 9; "PRT_S55"; ->[ACCOUNTS:32])
		LB_SetEnterable(->PRT_lb_ListboxPrintObjects; True:C214; 0)
		LB_SetChoiceList("DYMOAlign"; ->PRT_at_Alignment; ->Prt_at_LabelobjectAlignment)
		
		
		LB_SetChoiceList("DYMOTypes"; ->PRT_at_ItemTypes; ->PRT_at_LabelObjectType)
		LB_SetChoiceList("DYMOItemFonts"; ->PRT_at_ItemFonts; ->Prt_at_LabelObjectFont)
		LB_SetChoiceList("DYMOFontstyles"; ->PRT_at_FontStyles; ->Prt_at_labelobjectFontStyle)
		LB_SetChoiceList("DYMOFrame"; ->Prt_at_FrameOptions; ->Prt_at_labelobjectFrameOption)
		LB_SetChoiceList("DYMOColours"; ->PRT_at_ItemColors; ->Prt_at_labelobjectFramecolour)
		
		//0 none  //
		// 1 under
		//2 over
		//(3=over and under)
		//4 left
		//(5=Left  and under)
		//(6=left and over)
		//(7=left and over and under)
		//8 right
		//(9= right and under)
		//(10=right and over)
		//(11=right and over and under)
		//(12=Right and left)
		//(13)=right and left and under
		//(14=right and left and over)
		//(15=right and left and over and under)
		
		
		
		
		
		
		
End case 
ERR_MethodTrackerReturn("FM PRT_DymoLabelProject"; $_t_oldMethodName)
