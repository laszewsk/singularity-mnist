final times

Gregors amchine

| Timer 	 | Time/s | TAG |
| --- | --- | --- |
| Total           |  7.865 | docker-docker-cpu:RTX3090 |       
| Total           | 10.218 | docker-nvidia-cpu:RTX3090 |       
| Total           | 13.009 | docker-nvidia-gpu:RTX3090 |       
| Total           |  7.396 | singularity-docker-cpu:RTX3090 |  
| Total           | 11.551 | singularity-nvidia-cpu:RTX3090 |  
| Total           | 11.654 | singularity-docker-gpu:RTX3090 |  
| Total           | 11.892 | singularity-nvidia-gpu:RTX3090 |  




time Gregors machine

RTX3090

NVIDIA-SMI 530.30.02
Driver Version: 530.30.02
CUDA Version: 12.1    

singularity

```
+------------------+----------+--------+
| Name             | Status   |   Time |
|------------------+----------+--------+
| Total           | 11.357 |
| Loading in Data        |  0.142 |
| Model Fitting          |  7.502 |
| Model Evaluation       |  0.238 |
+------------------+----------+--------+
```

Dockerfile

```
+------------------+----------+--------+
| Name             | Status   |   Time |
|------------------+----------+--------+
| Total           | 12.592 |
| Loading in Data        |  0.948 |
| Model Fitting          | 12.852 |
| Model Evaluation       |  0.318 |
+------------------+----------+--------+
```

DGX - A100

Singularity - no GPU

```
+------------------+----------+--------+
| Name             | Status   |   Time |
|------------------+----------+--------+
| Total           | 11.909 |
| Loading in Data        |  0.221 |
| Model Fitting          | 11.192 |
| Model Evaluation       |  0.242 |
+------------------+----------+--------+
```

Singularity - With GPU

```
+------------------+----------+--------+
| Name             | Status   |   Time |
|------------------+----------+--------+
| Total           | 14.668 |
| Loading in Data        |  0.218 |
| Model Fitting          |  9.578 |
| Model Evaluation       |  0.331 |
+------------------+----------+--------+
```

Docker

NVIDIA-SMI 470.129.06
Driver Version: 470.129.06
CUDA Version: 11.4

```
+------------------+----------+--------+
| Name             | Status   |   Time |
|------------------+----------+--------+
| Total           | 15.904 |
| Loading in Data        |  0.527 |
| Model Fitting          | 13.316 |
| Model Evaluation       |  0.477 |
+------------------+----------+--------+
```