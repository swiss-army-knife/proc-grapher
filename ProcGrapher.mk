##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=ProcGrapher
ConfigurationName      :=Debug
WorkspacePath          := "/home/nihalsid/Documents/CPPSpace"
ProjectPath            := "/home/nihalsid/Documents/CPPSpace/ProcGrapher"
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=BigDataUbuntu
Date                   :=27/06/16
CodeLitePath           :="/home/nihalsid/.codelite"
LinkerName             :=/usr/bin/g++
SharedObjectLinkerName :=/usr/bin/g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="ProcGrapher.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)/usr/local/include 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)boost_system $(LibrarySwitch)boost_filesystem $(LibrarySwitch)boost_program_options $(LibrarySwitch)boost_iostreams 
ArLibs                 :=  "libboost_system.a" "libboost_filesystem.a" "libboost_program_options.a" "libboost_iostreams.a" 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch)libs 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /usr/bin/ar rcu
CXX      := /usr/bin/g++
CC       := /usr/bin/gcc
CXXFLAGS :=  -g -O0 -Wall -std=c++11 $(Preprocessors)
CFLAGS   :=  -g -O0 -Wall $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/source_main.cpp$(ObjectSuffix) $(IntermediateDirectory)/source_ProcInterface.cpp$(ObjectSuffix) $(IntermediateDirectory)/source_OutputUtils.cpp$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/source_main.cpp$(ObjectSuffix): source/main.cpp $(IntermediateDirectory)/source_main.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/nihalsid/Documents/CPPSpace/ProcGrapher/source/main.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/source_main.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/source_main.cpp$(DependSuffix): source/main.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/source_main.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/source_main.cpp$(DependSuffix) -MM "source/main.cpp"

$(IntermediateDirectory)/source_main.cpp$(PreprocessSuffix): source/main.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/source_main.cpp$(PreprocessSuffix) "source/main.cpp"

$(IntermediateDirectory)/source_ProcInterface.cpp$(ObjectSuffix): source/ProcInterface.cpp $(IntermediateDirectory)/source_ProcInterface.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/nihalsid/Documents/CPPSpace/ProcGrapher/source/ProcInterface.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/source_ProcInterface.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/source_ProcInterface.cpp$(DependSuffix): source/ProcInterface.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/source_ProcInterface.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/source_ProcInterface.cpp$(DependSuffix) -MM "source/ProcInterface.cpp"

$(IntermediateDirectory)/source_ProcInterface.cpp$(PreprocessSuffix): source/ProcInterface.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/source_ProcInterface.cpp$(PreprocessSuffix) "source/ProcInterface.cpp"

$(IntermediateDirectory)/source_OutputUtils.cpp$(ObjectSuffix): source/OutputUtils.cpp $(IntermediateDirectory)/source_OutputUtils.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/nihalsid/Documents/CPPSpace/ProcGrapher/source/OutputUtils.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/source_OutputUtils.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/source_OutputUtils.cpp$(DependSuffix): source/OutputUtils.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/source_OutputUtils.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/source_OutputUtils.cpp$(DependSuffix) -MM "source/OutputUtils.cpp"

$(IntermediateDirectory)/source_OutputUtils.cpp$(PreprocessSuffix): source/OutputUtils.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/source_OutputUtils.cpp$(PreprocessSuffix) "source/OutputUtils.cpp"


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


