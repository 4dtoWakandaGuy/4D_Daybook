If (False:C215)
	//object Name: [DIARY]Diary_inLW.Variable12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DOC_al_TemplatesInclude;0)
	//ARRAY TEXT(WS_at_TemplateNames;0)
	//ARRAY TEXT(WS_at_TemplateRefs;0)
	C_BOOLEAN:C305(DOC_bo_TemplateSelected)
	C_LONGINT:C283($_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_SelectedTempleRow; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; write; WS_l_TEMPLATEMGRCONTEXT)
	C_PICTURE:C286($_pic_4DWrite)
	C_TEXT:C284($_t_NewDocumentCode; $_t_oldMethodName; DB_t_CurrentFormUsage; DOC_t_DocumentCode; DOC_t_TemplateReference; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_inLW.Variable12"; Form event code:C388)

//here we want to find document templates and COPY one to here
ARRAY TEXT:C222(WS_at_TemplateRefs; 0)
ARRAY TEXT:C222(WS_at_TemplateNames; 0)
ARRAY LONGINT:C221(DOC_al_TemplatesInclude; Size of array:C274(WS_at_TemplateNames))
If (Old:C35([DIARY:12]Action_Code:9)="")
	//an unsaved letter
	Case of 
		: (WIN_t_CurrentInputForm="Diary_inLW")  //CREATING A4D write LETTER
			//the following few lines are so we can revert the document
			If (DOC_bo_TemplateSelected)
				//a template had already been selected
				$_l_SelectedTempleRow:=Find in array:C230(DOC_al_TemplatesInclude; 1)
				If ($_l_SelectedTempleRow>0)
					DOC_t_TemplateReference:=WS_at_TemplateRefs{$_l_SelectedTempleRow}
				End if 
			End if 
			//12/11/02 C_PICTURE(Write_P)
			//12/11/02 Write_P:=WR Area to picture (write;1;0)
			LET_FindTemplates
			//20001=no check
			//20002=some check
			//2004-check
			
			If (Records in selection:C76([DOCUMENTS:7])=0)
				DOC_bo_TemplateSelected:=False:C215
				//there are no 4D write templates
				//     ALERT("There are no  letter templates in this database")
				Gen_Alert("There are no letter templates in this database")
			Else 
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				OBJECT GET COORDINATES:C663(Self:C308->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				Let_selectTemplate("Cancel"; "Use Template"; ""; ($_l_WindowLeft+$_l_ObjectLeft); ($_l_WindowTop+$_l_ObjectBottom))
			End if 
			If (DOC_bo_TemplateSelected)
				$_t_NewDocumentCode:="'"
				$_l_SelectedTempleRow:=0
				$_l_SelectedTempleRow:=Find in array:C230(DOC_al_TemplatesInclude; 1)
				If ($_l_SelectedTempleRow>0)
					$_t_NewDocumentCode:=WS_at_TemplateRefs{$_l_SelectedTempleRow}
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=WS_at_TemplateRefs{$_l_SelectedTempleRow})
					ARRAY TEXT:C222(WS_at_TemplateRefs; 0)
					ARRAY TEXT:C222(WS_at_TemplateNames; 0)
					ARRAY LONGINT:C221(DOC_al_TemplatesInclude; 0)
					DelayTicks(60)
					READ WRITE:C146([DOCUMENTS:7])
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_NewDocumentCode)
					DUPLICATE RECORD:C225([DOCUMENTS:7])
					$_pic_4DWrite:=[DOCUMENTS:7]Write_:5
					WR PICTURE TO AREA:P12000:141(write; $_pic_4DWrite)
					If (DB_t_CurrentFormUsage="Q@")
						Set_DocumentCode(2; "Q"; DOC_t_DocumentCode)
					Else 
						Set_DocumentCode(2; "L"; DOC_t_DocumentCode)
					End if 
					[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
					[DOCUMENTS:7]Standard:9:=False:C215
					[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
					[DOCUMENTS:7]Heading:2:=[DIARY:12]Document_Heading:32
					[DOCUMENTS:7]Document_Class:14:=-([DOCUMENTS:7]Document_Class:14)
					[DOCUMENTS:7]Document_Status:15:=1
					DOC_SetWriteModifiable(write; 2; True:C214)
					WR REDRAW:P12000:10(write)
				End if 
			Else 
				REDUCE SELECTION:C351([DOCUMENTS:7]; 0)
				If (DOC_t_TemplateReference#"")
					//a Document template was previously selected
					//so get the template again and all that
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=WS_at_TemplateRefs{$_l_SelectedTempleRow})
					ARRAY TEXT:C222(WS_at_TemplateRefs; 0)
					ARRAY TEXT:C222(WS_at_TemplateNames; 0)
					ARRAY LONGINT:C221(DOC_al_TemplatesInclude; 0)
					
					WR PICTURE TO AREA:P12000:141(write; [DOCUMENTS:7]Write_:5)
					WR REDRAW:P12000:10(write)
					
					DelayTicks(30)
					
					DUPLICATE RECORD:C225([DOCUMENTS:7])
					DelayTicks(30)
					[DOCUMENTS:7]Write_:5:=WR Area to picture:P12000:139(write; 1; 0)
					If (DB_t_CurrentFormUsage="Q@")
						Set_DocumentCode(2; "Q"; DOC_t_DocumentCode)
					Else 
						Set_DocumentCode(2; "L"; DOC_t_DocumentCode)
					End if 
					[DOCUMENTS:7]Standard:9:=False:C215
					[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
					[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
					[DOCUMENTS:7]Heading:2:=[DIARY:12]Document_Heading:32
					[DOCUMENTS:7]Document_Class:14:=-([DOCUMENTS:7]Document_Class:14)
					[DOCUMENTS:7]Document_Status:15:=1
					DOC_SetWriteModifiable(write; 2; True:C214)
					DB_MenuAction("Functions"; "Add Product items"; 3; "")
				End if 
			End if 
			
			WR REDRAW:P12000:10(write)
			
			
			
			//revert to previous view
			//WR PICTURE TO AREA (write;Write_P)
			
			
			
			
		Else 
			
			
	End case 
	WR EXECUTE COMMAND:P12000:113(write; 803)
	
	WR ON ERROR:P12000:52("")
Else 
	//a saved letter-make a copy
	CONFIRM:C162("Do you wish to modify this letter, a revised copy of the letter will be made"; "No"; "Yes")
	
	If (OK=0)
		DUPLICATE RECORD:C225([DIARY:12])
		[DIARY:12]x_ID:50:=0
		DiarySetCode
		//the document should be loaded
		If ([DOCUMENTS:7]Document_Code:1#[DIARY:12]Document_Code:15)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[DIARY:12]Document_Code:15)
		End if 
		Set_DocumentCode(3)
		[DOCUMENTS:7]Standard:9:=False:C215
		[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
		[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
		[DOCUMENTS:7]Heading:2:=[DIARY:12]Document_Heading:32
		[DOCUMENTS:7]Document_Class:14:=4D Write Letter
		[DOCUMENTS:7]Document_Status:15:=1
		DOC_SetWriteModifiable(write; 2; True:C214)
		DB_MenuAction("Functions"; "Add Product items"; 3; "")
		
	End if 
	//WR PICTURE TO AREA (write;[DOCUMENTS]Write_)
	REDRAW:C174(write)
	
End if 
ERR_MethodTrackerReturn("OBJ:Diary_inLW,BgetTemplate"; $_t_oldMethodName)
