# Benchmarking_SLAM
Scripts and test results are provided here to facilitate decision tree training using evaluated benchmark properties. Raw evaluated benchmark summaries can be found in the root dir, where file **Benchmarks_Summ.xlsx** contains details of each benchmark and file **Records.xlsx** the summary of benchmark characteristics based on qualitative evaluation  Training related scripts can be found under folder **scripts** and _slo-mo_ results can be found under **results**.

To use the provided table file for training, we can simply execute script **train_decision_trees.m**, which will launch MATLAB classification GUI for training and result visualization. The basic workflow is to:

read in table => pre-processing => data formatting => configure classifier => train => visualization

Comment or uncomment some properties for subsequent training process, according to your own need. For example, if only VO is considered, the property _Revisit_Freq_ can be neglected beyond consideration. Cross-validation is recommended to avoid over-fit the model. Three level of decision trees are available, from simple to complex tree, according to their structure complexity (classification granularity). Same configuration might generate slightly different results if cross-validation is adopted since its group separation step is a random process, but usually it would mainly affect the accuracy rate rather than the tree structure. Once a decent/reliable result is available, you can export the trained model for visualization and subsequent classification. Detailed instruction can be found in the script comments. A complete instruction can be found here: <https://www.mathworks.com/help/stats/classification-learner-app.html>

Note: Classification GUI can be replaced by some simple codes, but it is more easy to tune the classifiers using some provided tools in the GUI, e.g. plot tools and classifier selection.

## Reference
	
	@article{ye2019characterizing,
	    title={Characterizing SLAM Benchmarks and Methods for the Robust Perception Age},
	    author={Ye, Wenkai and Zhao, Yipu and Vela, Patricio A},
	    journal={Workshop on Dataset Generation and Benchmarking of SLAM Algorithms for Robotics and VR/AR, IEEE Int. Conf. on Robotics and Automation (ICRA)},
	    year={2019}
  	}

## Contact information

- Wenkai Ye		wye1206@gatech.edu
- Yipu Zhao		yipu.zhao@gatech.edu
- Patricio A. Vela	pvela@gatech.edu
