//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetGraph
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:                              23/05/2011 22:42 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_Booleans; 0)
	ARRAY BOOLEAN:C223($_abo_XaxisBreaksBoolean; 0)
	ARRAY DATE:C224($_ad_Dates; 0)
	ARRAY DATE:C224($_ad_XaxisBreaksDates; 0)
	ARRAY INTEGER:C220($_ai_Integers; 0)
	ARRAY INTEGER:C220($_ai_XaxisBreaksInteger; 0)
	ARRAY LONGINT:C221($_al_Longintegers; 0)
	ARRAY LONGINT:C221($_al_ReferencesUsed; 0)
	ARRAY LONGINT:C221($_al_XaxisBreaksLongInteger; 0)
	ARRAY LONGINT:C221($_al_yAxis; 0)
	ARRAY REAL:C219($_ar_Reals; 0)
	ARRAY REAL:C219($_ar_XaxisBreaksReal; 0)
	ARRAY TEXT:C222($_at_SVGSliceColours1; 0)
	ARRAY TEXT:C222($_at_SVGSliceColours2; 0)
	ARRAY TEXT:C222($_at_Text; 0)
	ARRAY TEXT:C222($_at_XaxisBreaksText; 0)
	ARRAY TEXT:C222($_at_yLabel; 0)
	//ARRAY TEXT(DB_at_GraphObjectName;0)
	//ARRAY TEXT(DB_at_GraphObjects;0)
	//ARRAY TEXT(DB_at_GraphObjectType;0)
	//ARRAY TEXT(SVG_at_RGBref;0)
	//ARRAY TEXT(SVG_at_RGBrefLighter3;0)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_ArraySize; $_l_BreakNumber; $_l_BreakPoints; $_l_Breaks; $_l_ColumnsRequired; $_l_Index; $_l_Index2; $_l_NumberOfBars; $_l_ObjectWidth; $_l_OK; $_l_RandomReference)
	C_LONGINT:C283($_l_RefUsedPosition; $_l_SVGFontSize; $_l_xAxisBreaks; $_l_XaxisBreakType; $_r_NextLeft; $_r_ObjectRight; $_r_ObjectTop; $_r_WidthPerBar; $5; DB_l_CurrentDisplayedForm)
	C_POINTER:C301($_ptr_DataField; $_ptr_FieldPointer; $_ptr_TablePointer; $_ptr_toValuesArray; $_ptr_xAxisBreaksArray; $1)
	C_REAL:C285($_r_ActualBarSize; $_r_Arc; $_r_attachPointLeft; $_r_attachPointTop; $_r_CenterVert; $_r_Centre; $_r_ColumnHeight; $_r_Diameter; $_r_Hue; $_r_HundredPercentHeight; $_r_Left)
	C_REAL:C285($_r_LeftSpace; $_r_LineHeight; $_r_LineUnits; $_r_MaxSize; $_r_MaxValue; $_r_MaxWidth; $_r_NextArc; $_r_NextMax; $_r_NextPoint; $_r_NextVerticalEnd; $_r_NextVerticalEnd2)
	C_REAL:C285($_r_ObjectBottom; $_r_ObjectHeight; $_r_ObjectLeft; $_r_ObjectOrigin; $_r_Percantage; $_r_Percentage; $_r_percentage2; $_r_Point; $_r_PreviousArc; $_r_PreviousLabelBottom; $_r_PreviousLabelLeft)
	C_REAL:C285($_r_PreviousLabelRight; $_r_PreviousLabelTop; $_r_Right; $_r_Right2; $_r_RightOffset; $_r_SpaceAtTop; $_r_SpaceOnLeft; $_r_SpaceOnLeft2; $_r_SpaceSize; $_r_StartAt; $_r_TopOffset)
	C_REAL:C285($_r_TopOfObject; $_r_Total; $_r_Units; $2; $3; $4)
	C_TEXT:C284(<>SYS_t_DefaultFontPlain; $_t_Description; $_t_FieldName; $_t_FieldName2; $_t_GraphBackground; $_t_GraphFontColor; $_t_GraphForeground; $_t_GraphLinesColor; $_t_NodeReference; $_t_ObjectLabel; $_t_ObjectName)
	C_TEXT:C284($_t_ObjectReference; $_t_oldMethodName; $_t_SVGARCReference; $_t_SVGDomReference; $_t_SVGFontName; $_t_SVGGradientRef; $_t_TextValue)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetGraph")
COPY NAMED SELECTION:C331(Table:C252(DB_l_CurrentDisplayedForm)->; "$Temp")
DB_SetComplimentery
$_r_Hue:=0
$_r_StartAt:=1

//These are the default/bar/pie/line colour
ARRAY TEXT:C222($_at_SVGSliceColours1; 0)
ARRAY TEXT:C222($_at_SVGSliceColours2; 0)
ARRAY LONGINT:C221($_al_ReferencesUsed; 0)
$_l_ArraySize:=Size of array:C274(SVG_at_RGBref)
$_l_ArraySize:=Size of array:C274(SVG_at_RGBref)
Repeat 
	Repeat 
		$_l_RandomReference:=(Random:C100%($_l_ArraySize))+1
		
		
		$_l_RefUsedPosition:=Find in array:C230($_al_ReferencesUsed; $_l_RandomReference)
		If ($_l_RefUsedPosition<0)
			APPEND TO ARRAY:C911($_al_ReferencesUsed; $_l_RandomReference)
		Else 
			$_l_RandomReference:=-1
		End if 
	Until ($_l_RandomReference>0)  // | ($_r_Hue>360)
	If ($_l_RandomReference>0)
		APPEND TO ARRAY:C911($_at_SVGSliceColours1; SVG_at_RGBref{$_l_RandomReference})
		APPEND TO ARRAY:C911($_at_SVGSliceColours2; SVG_at_RGBrefLighter3{$_l_RandomReference})
		
	End if 
Until (Size of array:C274($_at_SVGSliceColours1)>=$_l_ArraySize)
ARRAY TEXT:C222(DB_at_GraphObjects; 0)
ARRAY TEXT:C222(DB_at_GraphObjectType; 0)
ARRAY TEXT:C222(DB_at_GraphObjectName; 0)
$_t_GraphBackground:="oldlace:40"
$_t_GraphForeground:="oldlace:40"
$_t_GraphFontColor:="Black"
$_t_GraphLinesColor:="Black"
$_t_SVGFontName:=<>SYS_t_DefaultFontPlain
$_l_SVGFontSize:=12
If (Count parameters:C259>=5)
	//$5 is the graph style preferences.
	//in the style preferences we can store.
	//1) The colour range options for bars or pies or lines
	//2) Gradient options for those bars-default or per bar/pie piece/lines
	//3) Fonts
	//4) Font size
	//5) Font Colour
	//Note keeping this simple not different fonts
	//6) Line Colur
	//7) Line Gradient
	//8) Background Colour
	//9) Background gradient
	
End if 
$_l_BreakPoints:=10
If (Count parameters:C259>=6)
	//Graph Setup Spefic Preferences
	//in the specific preferences we store
	//1) The X axis Field-not used in this method-passed to it
	//2) the x Axis Field-not used in theis metho-passed to it
	//3) The x axis label-if not defined defaults to field name
	//4) The y axis field label if not defined defaults to field name
	//5) The name(label) for the graph to show on screen
	//6-if bar graph number of divisions to show on Y axis if line number of milestones to highlight
	
End if 
If (Count parameters:C259>=5)
	If ($2#3)
		If ($4>0)
			$_ptr_FieldPointer:=Field:C253(DB_l_CurrentDisplayedForm; $5)
			ARRAY LONGINT:C221($_al_yAxis; 0)
			ARRAY TEXT:C222($_at_yLabel; 0)
			Case of 
				: (Type:C295($_ptr_FieldPointer->)=Is date:K8:7)
					ARRAY DATE:C224($_ad_XaxisBreaksDates; 0)
					DISTINCT VALUES:C339($_ptr_FieldPointer->; $_ad_XaxisBreaksDates)
					$_l_XaxisBreakType:=Is date:K8:7
					$_ptr_xAxisBreaksArray:=->$_ad_XaxisBreaksDates
				: (Type:C295($_ptr_FieldPointer->)=Is boolean:K8:9)
					ARRAY BOOLEAN:C223($_abo_XaxisBreaksBoolean; 2)
					$_abo_XaxisBreaksBoolean{1}:=False:C215
					$_abo_XaxisBreaksBoolean{2}:=True:C214
					$_l_XaxisBreakType:=Is boolean:K8:9
					$_ptr_xAxisBreaksArray:=->$_abo_XaxisBreaksBoolean
				: (Type:C295($_ptr_FieldPointer->)=Is alpha field:K8:1)
					ARRAY TEXT:C222($_at_XaxisBreaksText; 0)
					USE NAMED SELECTION:C332("$temp")
					DISTINCT VALUES:C339($_ptr_FieldPointer->; $_at_XaxisBreaksText)
					$_t_FieldName:=Field name:C257(DB_l_CurrentDisplayedForm; $4)
					$_l_XaxisBreakType:=Is alpha field:K8:1
					$_ptr_xAxisBreaksArray:=->$_at_XaxisBreaksText
					
				: (Type:C295($_ptr_FieldPointer->)=Is integer:K8:5)
					ARRAY INTEGER:C220($_ai_XaxisBreaksInteger; 0)
					USE NAMED SELECTION:C332("$temp")
					DISTINCT VALUES:C339($_ptr_FieldPointer->; $_ai_XaxisBreaksInteger)
					$_l_XaxisBreakType:=Is integer:K8:5
					$_ptr_xAxisBreaksArray:=->$_ai_XaxisBreaksInteger
				: (Type:C295($_ptr_FieldPointer->)=Is longint:K8:6)
					
					ARRAY LONGINT:C221($_al_XaxisBreaksLongInteger; 0)
					USE NAMED SELECTION:C332("$temp")
					DISTINCT VALUES:C339($_ptr_FieldPointer->; $_al_XaxisBreaksLongInteger)
					$_t_FieldName:=Field name:C257(DB_l_CurrentDisplayedForm; $4)
					$_l_XaxisBreakType:=Is longint:K8:6
					$_ptr_xAxisBreaksArray:=->$_al_XaxisBreaksLongInteger
				: (Type:C295($_ptr_FieldPointer->)=Is real:K8:4)
					ARRAY REAL:C219($_ar_XaxisBreaksReal; 0)
					USE NAMED SELECTION:C332("$temp")
					DISTINCT VALUES:C339($_ptr_FieldPointer->; $_ar_XaxisBreaksReal)
					$_l_XaxisBreakType:=Is real:K8:4
					$_ptr_xAxisBreaksArray:=->$_ar_XaxisBreaksReal
				: (Type:C295($_ptr_FieldPointer->)=Is text:K8:3)
					
					
			End case 
		Else 
			$_l_xAxisBreaks:=-1
		End if 
	Else 
		$_l_xAxisBreaks:=-1
	End if 
Else 
	$_l_xAxisBreaks:=-1
End if 




If ($4#0) & ($3#0)
	//$_t_SVGDomReference:=DOM Create XML Ref("svg")
	$_ptr_FieldPointer:=Field:C253(DB_l_CurrentDisplayedForm; $4)
	ARRAY LONGINT:C221($_al_yAxis; 0)
	ARRAY TEXT:C222($_at_yLabel; 0)
	Case of 
		: (Type:C295($_ptr_FieldPointer->)=Is date:K8:7)
			If ($_l_xAxisBreaks=-1)
				ARRAY DATE:C224($_ad_Dates; 0)
				
				DISTINCT VALUES:C339($_ptr_FieldPointer->; $_ad_Dates)
				$_t_FieldName:=Field name:C257(DB_l_CurrentDisplayedForm; $4)
				$_t_FieldName2:=""
				
				If ($3>0)
					$_ptr_DataField:=Field:C253(DB_l_CurrentDisplayedForm; $3)
					$_t_FieldName2:=Field name:C257(DB_l_CurrentDisplayedForm; $3)
				End if 
				$_r_MaxValue:=0
				
				For ($_l_Index2; 1; Size of array:C274($_ad_Dates))
					USE NAMED SELECTION:C332("$Temp")
					QUERY SELECTION:C341(Table:C252(DB_l_CurrentDisplayedForm)->; $_ptr_FieldPointer->=$_ad_Dates{$_l_Index2})
					If ($3>0)
						APPEND TO ARRAY:C911($_al_yAxis; Sum:C1($_ptr_DataField->))
					Else 
						//macro
						
					End if 
					If ($_al_yAxis{Size of array:C274($_al_yAxis)}>$_r_MaxValue)
						$_r_MaxValue:=$_al_yAxis{Size of array:C274($_al_yAxis)}
					End if 
				End for 
				
			Else 
				If (Count parameters:C259>=5)
					If ($5>0)
						For ($_l_Index; 1; Size of array:C274($_ptr_xAxisBreaksArray->))
							$_ptr_TablePointer:=Table:C252(DB_l_CurrentDisplayedForm)
							$_ptr_FieldPointer:=Field:C253(DB_l_CurrentDisplayedForm; $5)
							USE NAMED SELECTION:C332("$temp")
							QUERY SELECTION:C341($_ptr_TablePointer->; $_ptr_FieldPointer->=$_ptr_xAxisBreaksArray->{$_l_Index})
							COPY NAMED SELECTION:C331(Table:C252(DB_l_CurrentDisplayedForm)->; "$Temp2")
							ARRAY DATE:C224($_ad_Dates; 0)
							
							DISTINCT VALUES:C339($_ptr_FieldPointer->; $_ad_Dates)
							$_t_FieldName:=Field name:C257(DB_l_CurrentDisplayedForm; $4)
							$_t_FieldName2:=""
							
							If ($3>0)
								$_ptr_DataField:=Field:C253(DB_l_CurrentDisplayedForm; $3)
								$_t_FieldName2:=Field name:C257(DB_l_CurrentDisplayedForm; $3)
							End if 
							$_r_MaxValue:=0
							
							For ($_l_Index2; 1; Size of array:C274($_ad_Dates))
								USE NAMED SELECTION:C332("$Temp2")
								QUERY SELECTION:C341(Table:C252(DB_l_CurrentDisplayedForm)->; $_ptr_FieldPointer->=$_ad_Dates{$_l_Index2})
								If ($3>0)
									APPEND TO ARRAY:C911($_al_yAxis; Sum:C1($_ptr_DataField->))
								Else 
									//macro
									
								End if 
								If ($_al_yAxis{Size of array:C274($_al_yAxis)}>$_r_MaxValue)
									$_r_MaxValue:=$_al_yAxis{Size of array:C274($_al_yAxis)}
								End if 
							End for 
							
							
						End for 
					Else 
						//Pre-defined breaks
					End if 
				End if 
			End if 
			
			
		: (Type:C295($_ptr_FieldPointer->)=Is boolean:K8:9)
			If ($_l_xAxisBreaks=-1)
				ARRAY BOOLEAN:C223($_abo_Booleans; 2)
				$_abo_Booleans{1}:=False:C215
				$_abo_Booleans{2}:=True:C214
				If ($3>0)
					$_ptr_DataField:=Field:C253(DB_l_CurrentDisplayedForm; $3)
					
				End if 
				For ($_l_Index2; 1; Size of array:C274($_abo_Booleans))
					USE NAMED SELECTION:C332("$Temp")
					QUERY SELECTION:C341(Table:C252(DB_l_CurrentDisplayedForm)->; $_ptr_FieldPointer->=$_ad_Dates{$_l_Index2})
					If ($3>0)
						APPEND TO ARRAY:C911($_al_yAxis; Sum:C1($_ptr_DataField->))
					Else 
						//macro
						
					End if 
					If ($_al_yAxis{Size of array:C274($_al_yAxis)}>$_r_MaxValue)
						$_r_MaxValue:=$_al_yAxis{Size of array:C274($_al_yAxis)}
					End if 
				End for 
			End if 
			$_ptr_toValuesArray:=->$_abo_Booleans
		: (Type:C295($_ptr_FieldPointer->)=Is alpha field:K8:1)
			ARRAY TEXT:C222($_at_Text; 0)
			USE NAMED SELECTION:C332("$temp")
			DISTINCT VALUES:C339($_ptr_FieldPointer->; $_at_Text)
			$_t_FieldName:=Field name:C257(DB_l_CurrentDisplayedForm; $4)
			$_t_FieldName2:=""
			
			If ($3>0)
				$_ptr_DataField:=Field:C253(DB_l_CurrentDisplayedForm; $3)
				$_t_FieldName2:=Field name:C257(DB_l_CurrentDisplayedForm; $3)
			End if 
			$_r_MaxValue:=0
			$_r_LeftSpace:=60
			For ($_l_Index2; 1; Size of array:C274($_at_Text))
				If ($_at_Text{$_l_Index2}#"")
					USE NAMED SELECTION:C332("$Temp")
					QUERY SELECTION:C341(Table:C252(DB_l_CurrentDisplayedForm)->; $_ptr_FieldPointer->=$_at_Text{$_l_Index2})
					If ($3>0)
						APPEND TO ARRAY:C911($_al_yAxis; Sum:C1($_ptr_DataField->))
					Else 
						//macro
						
					End if 
					If ($_al_yAxis{Size of array:C274($_al_yAxis)}>$_r_MaxValue)
						$_r_MaxValue:=$_al_yAxis{Size of array:C274($_al_yAxis)}
					End if 
				Else 
					APPEND TO ARRAY:C911($_al_yAxis; 0)
				End if 
			End for 
			$_ptr_toValuesArray:=->$_at_Text
			
			
		: (Type:C295($_ptr_FieldPointer->)=Is integer:K8:5)
			ARRAY INTEGER:C220($_ai_Integers; 0)
			USE NAMED SELECTION:C332("$temp")
			DISTINCT VALUES:C339($_ptr_FieldPointer->; $_ai_Integers)
			$_t_FieldName:=Field name:C257(DB_l_CurrentDisplayedForm; $4)
			$_t_FieldName2:=""
			
			If ($3>0)
				$_ptr_DataField:=Field:C253(DB_l_CurrentDisplayedForm; $3)
				$_t_FieldName2:=Field name:C257(DB_l_CurrentDisplayedForm; $3)
			End if 
			$_r_MaxValue:=0
			$_r_LeftSpace:=60
			For ($_l_Index2; 1; Size of array:C274($_ai_Integers))
				If ($_ai_Integers{$_l_Index2}#0)
					USE NAMED SELECTION:C332("$Temp")
					QUERY SELECTION:C341(Table:C252(DB_l_CurrentDisplayedForm)->; $_ptr_FieldPointer->=$_ai_Integers{$_l_Index2})
					If ($3>0)
						APPEND TO ARRAY:C911($_al_yAxis; Sum:C1($_ptr_DataField->))
					Else 
						//macro
						
					End if 
					If ($_al_yAxis{Size of array:C274($_al_yAxis)}>$_r_MaxValue)
						$_r_MaxValue:=$_al_yAxis{Size of array:C274($_al_yAxis)}
					End if 
				Else 
					APPEND TO ARRAY:C911($_al_yAxis; 0)
				End if 
			End for 
			$_ptr_toValuesArray:=->$_ai_Integers
			
			
		: (Type:C295($_ptr_FieldPointer->)=Is longint:K8:6)
			
			ARRAY LONGINT:C221($_al_Longintegers; 0)
			USE NAMED SELECTION:C332("$temp")
			DISTINCT VALUES:C339($_ptr_FieldPointer->; $_al_Longintegers)
			$_t_FieldName:=Field name:C257(DB_l_CurrentDisplayedForm; $4)
			$_t_FieldName2:=""
			
			If ($3>0)
				$_ptr_DataField:=Field:C253(DB_l_CurrentDisplayedForm; $3)
				$_t_FieldName2:=Field name:C257(DB_l_CurrentDisplayedForm; $3)
			End if 
			$_r_MaxValue:=0
			$_r_LeftSpace:=60
			For ($_l_Index2; 1; Size of array:C274($_al_Longintegers))
				If ($_al_Longintegers{$_l_Index2}#0)
					USE NAMED SELECTION:C332("$Temp")
					QUERY SELECTION:C341(Table:C252(DB_l_CurrentDisplayedForm)->; $_ptr_FieldPointer->=$_al_Longintegers{$_l_Index2})
					If ($3>0)
						APPEND TO ARRAY:C911($_al_yAxis; Sum:C1($_ptr_DataField->))
					Else 
						//macro
						
					End if 
					If ($_al_yAxis{Size of array:C274($_al_yAxis)}>$_r_MaxValue)
						$_r_MaxValue:=$_al_yAxis{Size of array:C274($_al_yAxis)}
					End if 
				Else 
					APPEND TO ARRAY:C911($_al_yAxis; 0)
				End if 
			End for 
			$_ptr_toValuesArray:=->$_al_Longintegers
		: (Type:C295($_ptr_FieldPointer->)=Is real:K8:4)
			ARRAY REAL:C219($_ar_Reals; 0)
			USE NAMED SELECTION:C332("$temp")
			DISTINCT VALUES:C339($_ptr_FieldPointer->; $_ar_Reals)
			$_t_FieldName:=Field name:C257(DB_l_CurrentDisplayedForm; $4)
			$_t_FieldName2:=""
			If ($3>0)
				$_ptr_DataField:=Field:C253(DB_l_CurrentDisplayedForm; $3)
				$_t_FieldName2:=Field name:C257(DB_l_CurrentDisplayedForm; $3)
			End if 
			$_r_MaxValue:=0
			$_r_LeftSpace:=60
			For ($_l_Index2; 1; Size of array:C274($_ai_Integers))
				If ($_ai_Integers{$_l_Index2}#0)
					USE NAMED SELECTION:C332("$Temp")
					QUERY SELECTION:C341(Table:C252(DB_l_CurrentDisplayedForm)->; $_ptr_FieldPointer->=$_ai_Integers{$_l_Index2})
					If ($3>0)
						APPEND TO ARRAY:C911($_al_yAxis; Sum:C1($_ptr_DataField->))
					Else 
						//macro
						
					End if 
					If ($_al_yAxis{Size of array:C274($_al_yAxis)}>$_r_MaxValue)
						$_r_MaxValue:=$_al_yAxis{Size of array:C274($_al_yAxis)}
					End if 
				Else 
					APPEND TO ARRAY:C911($_al_yAxis; 0)
				End if 
			End for 
			$_ptr_toValuesArray:=->$_ar_Reals
			
		: (Type:C295($_ptr_FieldPointer->)=Is text:K8:3)
			//Dont think you should be able to use text fields
			$_t_FieldName:=Field name:C257(DB_l_CurrentDisplayedForm; $4)
			$_t_FieldName2:=""
			
			If ($3>0)
				$_ptr_DataField:=Field:C253(DB_l_CurrentDisplayedForm; $3)
				$_t_FieldName2:=Field name:C257(DB_l_CurrentDisplayedForm; $3)
			End if 
			$_r_MaxValue:=0
			$_r_LeftSpace:=60
			For ($_l_Index2; 1; Size of array:C274($_at_Text))
				If ($_at_Text{$_l_Index2}#"")
					USE NAMED SELECTION:C332("$Temp")
					QUERY SELECTION:C341(Table:C252(DB_l_CurrentDisplayedForm)->; $_ptr_FieldPointer->=$_at_Text{$_l_Index2})
					If ($3>0)
						APPEND TO ARRAY:C911($_al_yAxis; Sum:C1($_ptr_DataField->))
					Else 
						//macro
						
					End if 
					If ($_al_yAxis{Size of array:C274($_al_yAxis)}>$_r_MaxValue)
						$_r_MaxValue:=$_al_yAxis{Size of array:C274($_al_yAxis)}
					End if 
				Else 
					APPEND TO ARRAY:C911($_al_yAxis; 0)
				End if 
			End for 
			$_ptr_toValuesArray:=->$_at_Text
			
			
	End case 
	Case of 
		: ($2=1)  //Bar
			//Colours can be set for each bar
			OBJECT GET COORDINATES:C663($1->; $_r_ObjectLeft; $_r_ObjectTop; $_r_ObjectRight; $_r_ObjectBottom)
			$_r_ObjectHeight:=$_r_ObjectBottom-$_r_ObjectTop
			$_l_ObjectWidth:=$_r_ObjectRight-$_r_ObjectLeft
			$_t_SVGDomReference:=DOM Create XML Ref:C861("svg")
			$_t_ObjectLabel:="TESTING A LABEL"
			If ($_t_ObjectLabel#"")
				$_t_ObjectReference:=SVG_New_text($_t_SVGDomReference; $_t_ObjectLabel; 30; $_r_ObjectHeight-20; $_t_SVGFontName; $_l_SVGFontSize; 1; 2; $_t_GraphFontColor)
			End if 
			$_t_ObjectReference:=SVG_New_rect($_t_SVGDomReference; 0; 0; $_l_ObjectWidth; $_r_ObjectHeight; 5; 5; $_t_GraphBackground; $_t_GraphForeground)
			$_r_ObjectHeight:=$_r_ObjectHeight-80
			APPEND TO ARRAY:C911(DB_at_GraphObjects; $_t_ObjectReference)
			APPEND TO ARRAY:C911(DB_at_GraphObjectType; "Background")
			APPEND TO ARRAY:C911(DB_at_GraphObjectName; "Background")
			
			$_t_ObjectReference:=SVG_New_text($_t_SVGDomReference; $_t_FieldName2; 4; $_r_ObjectHeight-10; $_t_SVGFontName; $_l_SVGFontSize; 0; 4; $_t_GraphFontColor; 90)
			//$_t_ObjectReference:=SVG_New_text ($_t_SVGDomReference;$_t_FieldName2;4;$_r_ObjectHeight-10;$_t_SVGFontName;$_l_SVGFontSize;0;4;$_t_GraphFontColor;90)
			
			//"times";12)
			APPEND TO ARRAY:C911(DB_at_GraphObjects; $_t_ObjectReference)
			APPEND TO ARRAY:C911(DB_at_GraphObjectType; "Line")
			APPEND TO ARRAY:C911(DB_at_GraphObjectName; "Lines")
			
			$_t_ObjectReference:=SVG_New_line($_t_SVGDomReference; $_r_LeftSpace; 10; $_r_LeftSpace; $_r_ObjectHeight-10; $_t_GraphLinesColor; 1)
			APPEND TO ARRAY:C911(DB_at_GraphObjects; $_t_ObjectReference)
			APPEND TO ARRAY:C911(DB_at_GraphObjectType; "Line")
			APPEND TO ARRAY:C911(DB_at_GraphObjectName; "Lines")
			
			$_t_ObjectReference:=SVG_New_line($_t_SVGDomReference; $_r_LeftSpace; $_r_ObjectHeight-10; $_l_ObjectWidth-20; $_r_ObjectHeight-10; $_t_GraphLinesColor; 1)
			APPEND TO ARRAY:C911(DB_at_GraphObjects; $_t_ObjectReference)
			APPEND TO ARRAY:C911(DB_at_GraphObjectType; "Line")
			APPEND TO ARRAY:C911(DB_at_GraphObjectName; "Lines")
			
			$_t_ObjectReference:=SVG_New_text($_t_SVGDomReference; String:C10($_r_MaxValue); $_r_LeftSpace-5; 10; $_t_SVGFontName; 8; 0; 4; $_t_GraphFontColor)
			APPEND TO ARRAY:C911(DB_at_GraphObjects; $_t_ObjectReference)
			APPEND TO ARRAY:C911(DB_at_GraphObjectType; "Label")
			APPEND TO ARRAY:C911(DB_at_GraphObjectName; "Labels")
			
			$_t_NodeReference:=SVG_New_line($_t_SVGDomReference; $_r_LeftSpace-5; 10; $_r_LeftSpace; 10; $_t_GraphLinesColor; 1)
			$_l_Breaks:=$_l_BreakPoints
			$_r_Units:=$_r_MaxValue/($_l_BreakPoints+1)
			$_r_LineHeight:=$_r_ObjectHeight-20
			$_r_LineUnits:=$_r_LineHeight/$_r_MaxValue
			$_l_BreakNumber:=1
			Repeat 
				$_r_NextMax:=Round:C94($_r_Units*$_l_BreakNumber; 0)
				$_r_NextPoint:=$_r_LineHeight-($_l_BreakNumber*$_r_LineUnits*$_r_Units)
				
				$_t_NodeReference:=SVG_New_text($_t_SVGDomReference; String:C10($_r_NextMax); $_r_LeftSpace-5; $_r_NextPoint; $_t_SVGFontName; 8; 0; 4; $_t_GraphFontColor)
				$_t_NodeReference:=SVG_New_line($_t_SVGDomReference; $_r_LeftSpace-5; $_r_NextPoint; $_r_LeftSpace; $_r_NextPoint; $_t_GraphLinesColor; 1)
				$_l_Breaks:=$_l_Breaks-1
				$_l_BreakNumber:=$_l_BreakNumber+1
			Until ($_l_Breaks<1)
			$_l_NumberOfBars:=Size of array:C274($_ptr_toValuesArray->)
			$_t_NodeReference:=SVG_New_text($_t_SVGDomReference; $_t_FieldName; 5; $_r_ObjectHeight-5; $_t_SVGFontName; $_l_SVGFontSize; 0; 1; $_t_GraphFontColor)  //"times";12)
			
			$_r_MaxWidth:=40
			$_r_WidthPerBar:=Int:C8($_l_ObjectWidth/$_l_NumberOfBars)
			If ($_r_WidthPerBar<12)
				$_r_WidthPerBar:=20
			End if 
			$_r_ActualBarSize:=$_r_WidthPerBar-(($_r_WidthPerBar/100)*20)
			If ($_r_ActualBarSize>$_r_MaxWidth)
				$_r_ActualBarSize:=$_r_MaxWidth
				
			End if 
			
			$_r_NextLeft:=$_r_LeftSpace
			
			//$_r_ObjectHeight:=$_r_ObjectBottom-$_r_ObjectTop
			//$_l_ObjectWidth:=$_r_ObjectRight-$_r_ObjectLeft
			
			
			For ($_l_Index2; 1; Size of array:C274($_ptr_toValuesArray->))
				$_bo_Continue:=False:C215
				Case of 
						
					: (Type:C295($_ptr_toValuesArray->)=Text array:K8:16) | (Type:C295($_ptr_toValuesArray->)=String array:K8:15)
						If ($_ptr_toValuesArray->{$_l_Index2}#"")
							$_bo_Continue:=True:C214
						End if 
					: (Type:C295($_ptr_toValuesArray->)=Real array:K8:17) | (Type:C295($_ptr_toValuesArray->)=Integer array:K8:18) | (Type:C295($_ptr_toValuesArray->)=LongInt array:K8:19)
						If ($_ptr_toValuesArray->{$_l_Index2}#0)
							$_bo_Continue:=True:C214
						End if 
					: (Type:C295($_ptr_toValuesArray->)=Date array:K8:20)
						If ($_ptr_toValuesArray->{$_l_Index2}#!00-00-00!)
							$_bo_Continue:=True:C214
						End if 
						
				End case 
				If ($_bo_Continue)
					$_r_Centre:=$_r_WidthPerBar/2
					$_r_Left:=($_r_NextLeft+$_r_Centre)-($_r_ActualBarSize/2)
					$_r_HundredPercentHeight:=$_r_ObjectHeight-20
					$_r_Percentage:=$_al_yAxis{$_l_Index2}/($_r_MaxValue/100)
					If ($_l_Index2<Size of array:C274($_at_SVGSliceColours1))
						$_t_SVGGradientRef:=SVG_Define_linear_gradient($_t_SVGDomReference; "Object"+String:C10($_l_Index2); $_at_SVGSliceColours1{$_l_Index2}; $_at_SVGSliceColours2{$_l_Index2})
					End if 
					$_r_ColumnHeight:=(($_r_HundredPercentHeight/100)*$_r_Percentage)
					$_r_TopOfObject:=10+($_r_HundredPercentHeight-$_r_ColumnHeight)
					If ($_r_ColumnHeight=0)
						$_r_ColumnHeight:=1
					End if 
					//$_t_NodeReference:=SVG_New_rect ($_t_SVGDomReference;$_r_Left;(($_r_ObjectHeight-10)-$_r_ColumnHeight);$_r_ActualBarSize;$_r_ColumnHeight-1;0;0;"bisque";"bisque")
					If ($_l_Index2<Size of array:C274($_at_SVGSliceColours1))
						$_t_ObjectName:="url(#"+"Object"+String:C10($_l_Index2)+")"
						
						$_t_NodeReference:=SVG_New_rect($_t_SVGDomReference; $_r_Left; $_r_TopOfObject; $_r_ActualBarSize; $_r_ColumnHeight-2; 0; 0; $_t_ObjectName; $_t_ObjectName)
					Else 
						$_t_NodeReference:=SVG_New_rect($_t_SVGDomReference; $_r_Left; $_r_TopOfObject; $_r_ActualBarSize; $_r_ColumnHeight-2; 0; 0; "bisque"; "bisque")
					End if 
					If (($_r_ColumnHeight-7)<0)
						$_t_NodeReference:=SVG_New_rect($_t_SVGDomReference; $_r_Left+$_r_ActualBarSize+1; $_r_TopOfObject+5; 2; 1; 0; 9; "grey:32"; "grey:30")
					Else 
						
						$_t_NodeReference:=SVG_New_rect($_t_SVGDomReference; $_r_Left+$_r_ActualBarSize+1; $_r_TopOfObject+5; 2; $_r_ColumnHeight-7; 0; 9; "grey:32"; "grey:30")
					End if 
					$_t_NodeReference:=SVG_New_text($_t_SVGDomReference; String:C10($_ptr_toValuesArray->{$_l_Index2})+" ("+String:C10($_al_yAxis{$_l_Index2})+")"; ($_r_Left+($_r_ActualBarSize/2))-6; $_r_ObjectHeight-1; $_t_SVGFontName; $_l_SVGFontSize; 0; 1; $_t_GraphFontColor; 50)  //"times";12)
					//$_t_NodeReference:=SVG_New_text ($_t_SVGDomReference;(String(Int($_r_Percentage)))+" "+(String($_al_yAxis{$_l_Index2}));$_r_Left;$_r_ObjectHeight-30;$_t_SVGFontName;8;0;4)  `"times";12)
					$_r_NextLeft:=$_r_NextLeft+$_r_WidthPerBar
				End if 
			End for 
			
		: ($2=2)  //vector-sutired for time line stuff-3rd value
			
			
		: ($2=3)  // Pie
			//Colours Can be set
			
			OBJECT GET COORDINATES:C663($1->; $_r_ObjectLeft; $_r_ObjectTop; $_r_ObjectRight; $_r_ObjectBottom)
			$_r_CenterVert:=$_r_ObjectBottom-$_r_ObjectTop
			$_r_ObjectHeight:=$_r_ObjectBottom-$_r_ObjectTop
			$_l_ObjectWidth:=$_r_ObjectRight-$_r_ObjectLeft
			$_t_SVGDomReference:=DOM Create XML Ref:C861("svg")
			$_r_MaxSize:=$_l_ObjectWidth
			If ($_r_ObjectHeight<$_r_MaxSize)
				$_r_MaxSize:=$_r_ObjectHeight
			End if 
			$_r_MaxSize:=$_r_MaxSize-30
			//$_t_ObjectReference:=SVG_New_rect ($_t_SVGDomReference;0;0;$_l_ObjectWidth;$_r_ObjectHeight;5;5;$_t_GraphBackground;$_t_GraphForeground)
			
			$_t_ObjectReference:=SVG_New_circle($_t_SVGDomReference; 0+($_l_ObjectWidth/2); 0+($_r_MaxSize/2); $_r_MaxSize/2.5; "black"; "White"; 1)
			//$ObjectReference2:=SVG_New_circle ($_t_SVGDomReference;$_l_ObjectWidth/2;$_r_ObjectHeight/2;$_r_MaxSize/4;"black";"White";1)
			//$ObjectReference3:=SVG_New_circle ($_t_SVGDomReference;($_l_ObjectWidth/2);($_r_ObjectHeight/2);$_r_MaxSize/1.9;"black";"White";1)
			$_r_Diameter:=2*(Pi:K30:1)*($_r_MaxSize/4)
			$_r_ObjectOrigin:=$_r_ObjectHeight  //SVG_New_rect ($_t_SVGDomReference;0;0;$_l_ObjectWidth;$_r_ObjectHeight;5;5;$_t_GraphBackground;$_t_GraphForeground)
			$_r_ObjectHeight:=$_r_ObjectHeight-80
			SORT ARRAY:C229($_al_yAxis; $_ptr_toValuesArray->; <)  //largest first
			$_r_Total:=0
			For ($_l_Index2; 1; Size of array:C274($_al_yAxis))
				$_r_Total:=$_r_Total+$_al_yAxis{$_l_Index2}
			End for 
			$_r_NextArc:=0
			
			$_r_NextVerticalEnd:=10
			$_r_Right:=$_r_MaxSize+10
			$_l_ColumnsRequired:=Size of array:C274($_al_yAxis)/($_r_MaxSize/25)
			
			$_r_SpaceSize:=100  //($_l_ObjectWidth-$_r_Right)/$_l_ColumnsRequired
			$_r_Point:=-10
			
			$_r_PreviousLabelLeft:=0
			$_r_PreviousLabelTop:=0
			$_r_PreviousLabelRight:=0
			$_r_PreviousLabelBottom:=0
			$_r_NextVerticalEnd2:=20
			For ($_l_Index2; 1; Size of array:C274($_al_yAxis))
				$_r_Percantage:=$_al_yAxis{$_l_Index2}/($_r_Total/100)
				
				
				If ($_r_Percantage>0)
					$_r_Arc:=$_r_NextArc+(3.6*$_r_Percantage)
					
					If ($_l_Index2<Size of array:C274($_at_SVGSliceColours1))
						
						
						
						
						$_t_SVGGradientRef:=SVG_Define_linear_gradient($_t_SVGDomReference; "Object"+String:C10($_l_Index2); $_at_SVGSliceColours1{$_l_Index2}; $_at_SVGSliceColours2{$_l_Index2})
						$_t_ObjectName:="url(#"+"Object"+String:C10($_l_Index2)+")"
						$_t_SVGARCReference:=SVG_New_arc($_t_SVGDomReference; 0+($_l_ObjectWidth/2); 0+($_r_MaxSize/2); $_r_MaxSize/2.5; $_r_NextArc; $_r_Arc; "Black"; $_t_ObjectName)
						$_r_PreviousArc:=$_r_NextArc
						$_r_NextArc:=$_r_Arc
						
						$_r_Point:=$_r_PreviousArc+(($_r_NextArc-$_r_PreviousArc)/2)
						$_r_SpaceAtTop:=($_r_ObjectHeight/2)-($_r_MaxSize/2.5)
						//$RAD:=Degree *$_r_Point
						//$TAN:=Tan($RAD)
						$_r_SpaceOnLeft:=($_l_ObjectWidth/2)-($_r_MaxSize/2.5)
						SVG_PointOnArc(($_r_MaxSize/2.5); ($_r_MaxSize/2.5); $_r_Point; ->$_r_Right; ->$_r_NextVerticalEnd)
						$_r_SpaceAtTop:=(($_r_MaxSize/2)-($_r_MaxSize/2.7))
						$_r_SpaceOnLeft:=($_l_ObjectWidth/2)-($_r_MaxSize/2.7)
						
						SVG_PointOnArc(($_r_MaxSize/2.5); ($_r_MaxSize/2.7); $_r_Point; ->$_r_Right; ->$_r_NextVerticalEnd)
						//```
						$_r_SpaceAtTop:=(($_r_MaxSize/2)-($_r_MaxSize/2.2))
						$_r_SpaceOnLeft2:=($_l_ObjectWidth/2)-($_r_MaxSize/2.2)
						SVG_PointOnArc(($_r_MaxSize/2.5); ($_r_MaxSize/2.2); $_r_Point; ->$_r_Right2; ->$_r_NextVerticalEnd2)
						
						
						
						//if $_r_Point<180 $_r_Right is the point on the arc to which the label will be to the right of.
						//if $_r_Point>180 $_r_Right is the point on the arc to which the label will be to the left of
						
						//$_r_Right:=$_r_Right+30
						$_r_Right2:=0
						$_r_TopOffset:=0
						Case of 
							: ($_r_Point<=45)
								$_r_Right2:=$_r_Right+90-($_r_Point)
							: ($_r_Point<=90)
								$_r_Right2:=$_r_Right+90-(90-$_r_Point)
								//$_r_NextVerticalEnd2:=$_r_NextVerticalEnd2-(Abs($_r_Point-90)/2)
							: ($_r_Point<=(180-45))
								$_r_Right2:=$_r_Right+90+(($_r_Point-90))
								//$_r_NextVerticalEnd2:=$_r_NextVerticalEnd2+(Abs(180-$_r_Point)/2)
							: ($_r_Point<=180)
								$_r_Right2:=$_r_Right+90+(($_r_Point-90))
								//$_r_NextVerticalEnd2:=$_r_NextVerticalEnd2+(Abs(180-$_r_Point)/2)
							: ($_r_Point<180+45)
								$_r_Right2:=$_r_SpaceOnLeft-90+(($_r_Point-90))
						End case 
						$_r_percentage2:=Round:C94($_r_Percantage; 2)
						$_t_TextValue:=String:C10($_ptr_toValuesArray->{$_l_Index2})+" ("+String:C10($_al_yAxis{$_l_Index2})+")"+String:C10($_r_percentage2)+"%"
						$_r_SpaceSize:=9*0.72*Length:C16($_t_TextValue)
						$_r_RightOffset:=0
						$_r_TopOffset:=0
						$_t_ObjectReference:=SVG_New_circle($_t_SVGDomReference; 0+$_r_Right+$_r_SpaceOnLeft; $_r_SpaceAtTop+$_r_NextVerticalEnd; 3; "black"; "black"; 1)
						
						//$_t_NodeReference:=SVG_New_line ($_t_SVGDomReference;$_r_Right+$_r_SpaceOnLeft;$_r_SpaceAtTop+$_r_NextVerticalEnd;$_r_Right2+$_r_SpaceOnLeft2;$_r_SpaceAtTop+$_r_NextVerticalEnd2;$_t_GraphLinesColor;1)
						Case of 
							: ($_r_Point<=45)  //attach on bottom
								$_r_attachPointLeft:=($_r_Right2+$_r_SpaceOnLeft2)-($_r_SpaceSize/(2))
								$_r_attachPointTop:=($_r_SpaceAtTop+$_r_NextVerticalEnd2)-20
								$_r_attachPointLeft:=$_r_Right2+$_r_SpaceOnLeft2
								$_r_attachPointTop:=$_r_SpaceAtTop+$_r_NextVerticalEnd2-10
							: ($_r_Point<=(90+45))  //attach on left
								$_r_attachPointLeft:=$_r_Right2+$_r_SpaceOnLeft2
								$_r_attachPointTop:=$_r_SpaceAtTop+$_r_NextVerticalEnd2-10
							: ($_r_Point<=(180+45))  //attach in top
								$_r_attachPointLeft:=($_r_Right2+$_r_SpaceOnLeft2)-($_r_SpaceSize/2)
								$_r_attachPointTop:=($_r_SpaceAtTop+$_r_NextVerticalEnd2)
								
							: ($_r_Point<=(270+45))  //attach on right
								$_r_attachPointLeft:=($_r_Right2+$_r_SpaceOnLeft2)-($_r_SpaceSize)
								$_r_attachPointTop:=($_r_SpaceAtTop+$_r_NextVerticalEnd2)-10
							Else   //attach on bottom
								$_r_attachPointLeft:=($_r_Right2+$_r_SpaceOnLeft2)-($_r_SpaceSize/2)
								$_r_attachPointTop:=($_r_SpaceAtTop+$_r_NextVerticalEnd2)-20
								
						End case 
						//`
						$_r_SpaceSize:=9*0.72*Length:C16($_t_TextValue)
						If ($_r_attachPointLeft>=$_r_PreviousLabelLeft)  //This object is to the right of the last object
							If ($_r_attachPointLeft<($_r_PreviousLabelRight+5))  // if the left of this object is less than the right of the last object
								If ($_r_attachPointTop>$_r_PreviousLabelTop)  //we are moving down
									If ($_r_PreviousLabelBottom>($_r_attachPointTop+5))
										//then we are crowded
										$_l_OK:=0
										Repeat 
											$_r_attachPointLeft:=$_r_attachPointLeft+1
											$_r_attachPointTop:=$_r_attachPointTop+1
											//we only need it moved enough
											If ($_r_attachPointLeft>($_r_PreviousLabelRight+5)) | (($_r_attachPointTop+5)>($_r_PreviousLabelBottom))
												$_l_OK:=1
											End if 
										Until ($_l_OK=1)
									End if 
								Else 
									//we are moving up
									If (($_r_PreviousLabelTop-5)<($_r_attachPointTop+20))
										$_l_OK:=0
										Repeat 
											$_r_attachPointLeft:=$_r_attachPointLeft+1
											$_r_attachPointTop:=$_r_attachPointTop-1
											//we only need it moved enough
											If ($_r_attachPointLeft>($_r_PreviousLabelRight+5)) | (($_r_attachPointTop+20)<($_r_PreviousLabelTop-5))
												$_l_OK:=1
											End if 
										Until ($_l_OK=1)
									End if 
									
								End if 
							Else 
								
							End if 
						Else   //this object is to the left of the previous object
							
							
							If (($_r_attachPointLeft+$_r_SpaceSize)>($_r_PreviousLabelLeft-5))  // if the right of this object is less than the left of the last object
								If ($_r_attachPointTop>$_r_PreviousLabelTop)  //we are moving down
									If ($_r_PreviousLabelBottom>($_r_attachPointTop-5))
										//then we are crowded
										$_l_OK:=0
										Repeat 
											$_r_attachPointLeft:=$_r_attachPointLeft-1
											$_r_attachPointTop:=$_r_attachPointTop+1
											//we only need it moved enough
											If (($_r_attachPointLeft+$_r_SpaceSize)<($_r_PreviousLabelLeft-5)) | ($_r_attachPointTop>($_r_PreviousLabelBottom+5))
												$_l_OK:=1
											End if 
										Until ($_l_OK=1)
									End if 
								Else 
									
									//we are moving up
									If (($_r_PreviousLabelTop-5)>($_r_attachPointTop+20))
										$_l_OK:=0
										Repeat 
											$_r_attachPointLeft:=$_r_attachPointLeft-1
											$_r_attachPointTop:=$_r_attachPointTop-1
											//we only need it moved enough
											If ($_r_attachPointLeft+$_r_SpaceSize<($_r_PreviousLabelLeft-5)) | (($_r_attachPointTop+20)<($_r_PreviousLabelTop-5))
												$_l_OK:=1
											End if 
										Until ($_l_OK=1)
									End if 
									
								End if 
							End if 
						End if 
						//``
						
						$_t_NodeReference:=SVG_New_line($_t_SVGDomReference; $_r_Right+$_r_SpaceOnLeft; $_r_SpaceAtTop+$_r_NextVerticalEnd; $_r_Right2+$_r_SpaceOnLeft2; $_r_SpaceAtTop+$_r_NextVerticalEnd2; $_t_GraphLinesColor; 1)
						
						
						$_t_NodeReference:=SVG_New_rect($_t_SVGDomReference; $_r_attachPointLeft; $_r_attachPointTop; $_r_SpaceSize; 20; 0; 9; "Black"; $_t_ObjectName)
						$_t_NodeReference:=SVG_New_text($_t_SVGDomReference; String:C10($_ptr_toValuesArray->{$_l_Index2})+" ("+String:C10($_al_yAxis{$_l_Index2})+")"+String:C10($_r_percentage2)+"%"; $_r_attachPointLeft+5; $_r_attachPointTop; $_t_SVGFontName; $_l_SVGFontSize; 0; 1; $_t_GraphFontColor; 0)  //"times";12)
						
						$_t_Description:=SVG_Set_description($_t_SVGARCReference; $_t_TextValue)
						
						$_r_PreviousLabelLeft:=$_r_attachPointLeft
						$_r_PreviousLabelTop:=$_r_attachPointTop
						$_r_PreviousLabelRight:=$_r_SpaceSize+$_r_attachPointLeft
						$_r_PreviousLabelBottom:=$_r_attachPointTop+20
						
						$_r_NextVerticalEnd:=$_r_NextVerticalEnd+26
						If ($_r_NextVerticalEnd>$_r_MaxSize)
							$_r_Right:=$_r_Right+$_r_SpaceSize+5
							$_r_NextVerticalEnd:=10
						End if 
					End if 
					
					
					//$ob->Function result
				End if 
			End for 
			
			
		: ($2=4)  //Horizontal Bar
			
			
	End case 
	SVG EXPORT TO PICTURE:C1017($_t_SVGDomReference; $1->; Copy XML data source:K45:17)
End if 
USE NAMED SELECTION:C332("$temp")
ERR_MethodTrackerReturn("DB_SetGraph"; $_t_oldMethodName)