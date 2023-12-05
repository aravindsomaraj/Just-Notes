# FastCaps [↩](../Contents/BTP.md)

- CNN used for **object detection and image segmentation**.
- CapsNet tries to remove pooling layer to improve **spatial characteristics** and improve learning capability.
  - Results in higher MAC/Memory ratio and is more compute-intensive than similar CNNs such as ResNet-18 and AlexNet.
- Accelerating on edge devices with limited resources is challenging.
  
To address this, various techniques have been proposed to reduce the computation and memory of CNNs, such as :
- quantization of network parameters
- low-rank matrix approximations
- circulant projection
- pruning
Pruning methods offer higher compression rates and reduce redundancy in network parameters, improving computational latency and energy consumption when deployed on hardware devices. <details><summary><b>About Pruning</b></summary>
A study comparing the original, pruned, and pruned-optimized CapsNet models showed that pruning enhances performance, with throughput increasing from 5 FPS to 82 FPS and 48 FPS for MNIST and F-MNIST datasets, respectively. Additionally, energy efficiency improves from 1.8 FPJ to 41.8 FPJ and 24.5 FPJ for the same datasets.
</details>

## About the Paper
This paper presents a novel two-step approach for deploying the CapsNet model on FPGA.  
The first step involves pruning **using the structured Look-Ahead Kernel Pruning** (LAKP) technique, which **prunes redundant kernels from a model based on the look-ahead score**. This simple pruning method achieves better compression rates than the state-of-the-art magnitude-based kernel pruning.  
In the case of CapsNet, **pruning the kernel reduces the number of capsules in the capsule layer and decreases the number of weight parameters and computation required for the routing algorithm**. (Experiments show that using LAKP with a 99.26% pruning rate resulted in a significant decrease in the number of weight parameters in the routing algorithm up to 1280 times). 

The second step **involves reducing the hardware complexity of the dynamic routing algorithm** by simplifying its non-linear operations, reordering loops, and parallelizing operations. Experimental results on MNIST and F-MNIST datasets show that the proposed CapsNet accelerator achieved a significant throughput of 1351 FPS and 934 FPS, respectively, 270x and 187x better than the original CapsNet implementation.

CapsNet uses capsules, a group of neurons organized in a vector, to perform various recognition tasks. 

> The capsule structure and dynamic routing between capsule layers replace the pooling layers used in CNNs.  

CapsNet's advantage lies in its ability to preserve spatial information of detected features when performing different types of recognition tasks. The architecture consists of three layers: Convolution, PrimaryCaps, and DigitCaps. The dynamic routing algorithm measures the agreement between capsules present in layer *l* and layer *l+1*, with the input being the prediction vector for capsule *j* in layer *l+1*. The algorithm initializes logits *b<sub>ij</sub>* to zero and computes the coupling coefficient *c<sub>ij</sub>* for all mapping between capsules in layer *l* and capsule *j* in layer *l+1*. The coupling coefficients are refined by measuring the agreement between the output *v<sub>j</sub>* of each capsule in layer *l+1* and the prediction vector *u<sub>j/i</sub>*. However, parallelization on a large scale is challenging due to hardware constraints.

Look-Ahead pruning, a kernel-based structured pruning method, outperforms magnitude-based pruning without increasing computation cost. It takes the weight parameters of adjacent layers and computes the look-ahead score for each parameter. Structured kernel pruning, due to its structured nature, is compatible with most neural accelerators and embedded GPUs, improving computational latency and reducing energy consumption by reducing the number of memory references.

In this paper, we propose a kernel-based structured pruning method, Look-Ahead Kernel Pruning (LAKP), which uses the sum of look-ahead scores of the parameters and shows better compression rate compared to magnitude-based kernel pruning, particularly in the high-sparsity regime. We pruned the CapsNet using the novel LAKP method and achieved an effective compression rate of 99.26% (with an accuracy drop of less than 1%) and reduced more than 99.26% of floating point operations, which is significantly better than unstructured pruning. 
