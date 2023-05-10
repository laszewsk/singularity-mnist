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
| Total runtime    | ok       | 11.357 |
| Loading in Data  | ok       |  0.142 |
| Model Fitting    | ok       |  7.502 |
| Model Evaluation | ok       |  0.238 |
+------------------+----------+--------+
```

Dockerfile

```
+------------------+----------+--------+
| Name             | Status   |   Time |
|------------------+----------+--------+
| Total runtime    | ok       | 12.592 |
| Loading in Data  | ok       |  0.948 |
| Model Fitting    | ok       | 12.852 |
| Model Evaluation | ok       |  0.318 |
+------------------+----------+--------+
```

DGX - A100

Singularity - no GPU

```
+------------------+----------+--------+
| Name             | Status   |   Time |
|------------------+----------+--------+
| Total runtime    | ok       | 11.909 |
| Loading in Data  | ok       |  0.221 |
| Model Fitting    | ok       | 11.192 |
| Model Evaluation | ok       |  0.242 |
+------------------+----------+--------+
```

Singularity - With GPU

```
+------------------+----------+--------+
| Name             | Status   |   Time |
|------------------+----------+--------+
| Total runtime    | ok       | 14.668 |
| Loading in Data  | ok       |  0.218 |
| Model Fitting    | ok       |  9.578 |
| Model Evaluation | ok       |  0.331 |
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
| Total runtime    | ok       | 15.904 |
| Loading in Data  | ok       |  0.527 |
| Model Fitting    | ok       | 13.316 |
| Model Evaluation | ok       |  0.477 |
+------------------+----------+--------+
```