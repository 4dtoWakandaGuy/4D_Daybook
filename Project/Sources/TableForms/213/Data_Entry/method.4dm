
If (False:C215)
	//Object Name:      [Attribute_Classes].Data_Entry
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PAC_al_ClassTypes;0)
	//ARRAY LONGINT(PAC_al_ImperialWeights;0)
	//ARRAY LONGINT(PAC_al_MetricWeights;0)
	//ARRAY LONGINT(PAC_al_Weighttypes;0)
	//ARRAY TEXT(PAC_at_ClassTypes;0)
	//ARRAY TEXT(PAC_at_DataTypes;0)
	//ARRAY TEXT(PAC_at_ImperialWeights;0)
	//ARRAY TEXT(PAC_at_MetricWeights;0)
	//ARRAY TEXT(PAC_at_WeightTypes;0)
	C_BOOLEAN:C305($_bo_AdminUser)
	C_LONGINT:C283($_l_ImperialWeightList; $_l_MeasureListID; $_l_MetricWeightList; $_l_Tries; $_l_WeightsLIstID)
	C_TEXT:C284($_t_oldMethodName; PAC_t_AttributeDataType)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [Attribute_Classes]Data_Entry"; Form event code:C388)
Case of 
	: (Form event code:C388=On Load:K2:1)
		ARRAY TEXT:C222(PAC_at_DataTypes; 0)
		APPEND TO ARRAY:C911(PAC_at_DataTypes; "Text")
		APPEND TO ARRAY:C911(PAC_at_DataTypes; "Numeric")
		If ([Attribute_Classes:213]ClassDataValuetype:3#0)
			OBJECT SET VISIBLE:C603(*; "oDataTypesList"; False:C215)
			Case of 
				: ([Attribute_Classes:213]ClassDataValuetype:3=Is text:K8:3)
					PAC_t_AttributeDataType:="Text"
					OBJECT SET VISIBLE:C603(*; "oClassIsRange"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oClassHasNumeric"; True:C214)
					
				Else 
					PAC_t_AttributeDataType:="Numeric"
					OBJECT SET VISIBLE:C603(*; "oClassIsRange"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oClassHasNumeric"; False:C215)
					[Attribute_Classes:213]ClassHasNumericValue:5:=True:C214
			End case 
			
		Else 
			PAC_t_AttributeDataType:=""
			OBJECT SET VISIBLE:C603(*; "oClassIsRange"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oClassHasNumeric"; False:C215)
			
		End if 
		If ([Attribute_Classes:213]ClassID:2=0)
			[Attribute_Classes:213]ClassID:2:=AA_GetNextID(->[Attribute_Classes:213]ClassID:2)
		End if 
		$_bo_AdminUser:=User in group:C338("Administrators"; Current user:C182)
		
		ARRAY TEXT:C222(PAC_at_ClassTypes; 0)
		ARRAY LONGINT:C221(PAC_al_ClassTypes; 0)
		ARRAY TEXT:C222(PAC_at_WeightTypes; 0)
		ARRAY LONGINT:C221(PAC_al_Weighttypes; 0)
		ARRAY TEXT:C222(PAC_at_MetricWeights; 0)
		ARRAY LONGINT:C221(PAC_al_MetricWeights; 0)
		
		$_l_MeasureListID:=AA_LoadListByName("Measure Types"; ->PAC_at_ClassTypes; ->PAC_al_ClassTypes)
		If (Size of array:C274(PAC_at_ClassTypes)=0)
			AA_ListAddItembyID($_l_MeasureListID; "Weight(Mass)"; "Fluid Volume"; "Dimension"; "Area(nn x nn)"; "Area Volume(nn x nn x nn)"; "Angle")
			$_l_WeightsLIstID:=AA_LoadListByName("Weight Types"; ->PAC_at_WeightTypes; ->PAC_al_Weighttypes)
			If (Size of array:C274(PAC_at_WeightTypes)=0)
				AA_ListAddItembyID($_l_WeightsLIstID; "Metric"; "Imperial")
				//now build both metric and imperial lists
				$_l_MetricWeightList:=AA_LoadListByName("Metric Weights"; ->PAC_at_MetricWeights; ->PAC_al_MetricWeights)
				If (Size of array:C274(PAC_at_MetricWeights)=0)
					While (Semaphore:C143("LoadingListofLists"))
						$_l_Tries:=$_l_Tries+1
						DelayTicks(2*$_l_Tries)
					End while 
					AA_ListAddItembyID($_l_MetricWeightList; "Milligrams"; "Centrigrams"; "decigrams"; "Grams"; "Dekagrams"; "Hectograms"; "Kilograms"; "Metric Tons")
					
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_MetricWeightList; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="Millograms")
					AA_SetListItemProperty("ABBREV"; 1; "mg")
					DB_SaveRecord(->[LIST_ITEMS:95])
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_MetricWeightList; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="Centrigrams")
					AA_SetListItemProperty("ABBREV"; 2; "cg")
					DB_SaveRecord(->[LIST_ITEMS:95])
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_MetricWeightList; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="decigrams")
					AA_SetListItemProperty("ABBREV"; 3; "dg")
					DB_SaveRecord(->[LIST_ITEMS:95])
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_MetricWeightList; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="Grams")
					AA_SetListItemProperty("ABBREV"; 4; "g")
					DB_SaveRecord(->[LIST_ITEMS:95])
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_MetricWeightList; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="Dekagrams")
					AA_SetListItemProperty("ABBREV"; 5; "dag")
					DB_SaveRecord(->[LIST_ITEMS:95])
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_MetricWeightList; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="Hectograms")
					AA_SetListItemProperty("ABBREV"; 6; "hg")
					DB_SaveRecord(->[LIST_ITEMS:95])
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_MetricWeightList; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="Kilograms")
					AA_SetListItemProperty("ABBREV"; 7; "Kg")
					DB_SaveRecord(->[LIST_ITEMS:95])
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_MetricWeightList; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="Metric Tons")
					AA_SetListItemProperty("ABBREV"; 8; "t")
					DB_SaveRecord(->[LIST_ITEMS:95])
					UNLOAD RECORD:C212([LIST_ITEMS:95])
					READ ONLY:C145([LIST_ITEMS:95])
					CLEAR SEMAPHORE:C144("Loadinglistoflists")
				End if 
				While (Semaphore:C143("LoadingListofLists"))
					$_l_Tries:=$_l_Tries+1
					DelayTicks(2*$_l_Tries)
				End while 
				READ WRITE:C146([LIST_ITEMS:95])
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_WeightsLIstID; *)
				QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="Metric")
				AA_SetListItemProperty("SUBLIST"; $_l_MetricWeightList)
				DB_SaveRecord(->[LIST_ITEMS:95])
				AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
				UNLOAD RECORD:C212([LIST_ITEMS:95])
				READ ONLY:C145([LIST_ITEMS:95])
				CLEAR SEMAPHORE:C144("Loadinglistoflists")
				ARRAY TEXT:C222(PAC_at_ImperialWeights; 0)
				ARRAY LONGINT:C221(PAC_al_ImperialWeights; 0)
				$_l_ImperialWeightList:=AA_LoadListByName("Imperial Weights"; ->PAC_at_ImperialWeights; ->PAC_al_ImperialWeights)
				If (Size of array:C274(PAC_at_ImperialWeights)=0)
					AA_ListAddItembyID($_l_ImperialWeightList; "Ounces"; "Pounds"; "Stones"; "Hundredweights"; "ton")
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_ImperialWeightList; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="Ounces")
					AA_SetListItemProperty("ABBREV"; 1; "oz")
					DB_SaveRecord(->[LIST_ITEMS:95])
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_ImperialWeightList; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="Pounds")
					AA_SetListItemProperty("ABBREV"; 2; "lb")
					DB_SaveRecord(->[LIST_ITEMS:95])
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_ImperialWeightList; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="Stones")
					AA_SetListItemProperty("ABBREV"; 3; "st")
					DB_SaveRecord(->[LIST_ITEMS:95])
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_ImperialWeightList; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="Hundredweights")
					AA_SetListItemProperty("ABBREV"; 4; "cwt")
					DB_SaveRecord(->[LIST_ITEMS:95])
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_ImperialWeightList; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="ton")
					AA_SetListItemProperty("ABBREV"; 5; "t")
					DB_SaveRecord(->[LIST_ITEMS:95])
					
				End if 
				While (Semaphore:C143("LoadingListofLists"))
					$_l_Tries:=$_l_Tries+1
					DelayTicks(2*$_l_Tries)
				End while 
				READ WRITE:C146([LIST_ITEMS:95])
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_WeightsLIstID; *)
				QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="Imperial")
				AA_SetListItemProperty("SUBLIST"; $_l_ImperialWeightList)
				DB_SaveRecord(->[LIST_ITEMS:95])
				AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
				UNLOAD RECORD:C212([LIST_ITEMS:95])
				READ ONLY:C145([LIST_ITEMS:95])
				CLEAR SEMAPHORE:C144("Loadinglistoflists")
				//now attache
				
				
				
				
				
				
			End if 
			
		End if 
		
		APPEND TO ARRAY:C911(PAC_at_ClassTypes; "Weight")
		APPEND TO ARRAY:C911(PAC_at_ClassTypes; "Volume")
		
		APPEND TO ARRAY:C911(PAC_at_ClassTypes; "Color")
End case 
ERR_MethodTrackerReturn("FM [Attribute_Classes]Data_Entry"; $_t_oldMethodName)
