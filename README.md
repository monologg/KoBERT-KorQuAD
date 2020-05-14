# KoBERT-KorQuAD

- Korean MRC (KorQuAD) with KoBERT
- 🤗Huggingface Tranformers🤗 라이브러리를 이용하여 구현

## Dependencies

- torch>=1.1.0
- transformers==2.9.1
- tensorboardX>=2.0

## How to use KoBERT on Huggingface Transformers Library

- 기존의 KoBERT를 transformers 라이브러리에서 곧바로 사용할 수 있도록 맞췄습니다.
  - transformers v2.2.2부터 개인이 만든 모델을 transformers를 통해 직접 업로드/다운로드하여 사용할 수 있습니다
- Tokenizer를 사용하려면 `tokenization_kobert.py`에서 `KoBertTokenizer`를 임포트해야 합니다.

```python
from transformers import BertModel
from tokenization_kobert import KoBertTokenizer

model = BertModel.from_pretrained('monologg/kobert')
tokenizer = KoBertTokenizer.from_pretrained('monologg/kobert')
```

## Usage

코드의 경우 Huggingface Transformers의 example 코드를 가져와 사용하였습니다.

### 1. Training

```bash
$ python3 run_squad.py --model_type kobert \
                       --model_name_or_path monologg/kobert \
                       --output_dir models \
                       --data_dir data \
                       --train_file KorQuAD_v1.0_train.json \
                       --predict_file KorQuAD_v1.0_dev.json \
                       --evaluate_during_training \
                       --per_gpu_train_batch_size 8 \
                       --per_gpu_eval_batch_size 8 \
                       --max_seq_length 512 \
                       --logging_steps 4000 \
                       --save_steps 4000 \
                       --do_train
```

- **train 중간에 진행되는 dev set evaluation에서 official EM/F1 score도 보여주게 하였습니다.**

  ![image](https://user-images.githubusercontent.com/28896432/74602419-9248c280-50eb-11ea-91c9-64a6e00beb2d.png)

- DistilKoBert의 경우 argument를 아래와 같이 바꿔주면 됩니다
  - --model_type distilkobert
  - --model_name_or_path monologg/distilkobert

### 2. Evaluation

```console
$ python3 evaluate_v1_0.py {$data_dir}/KorQuAD_v1.0_dev.json {$output_dir}/predictions_.json
```

## Results

- Dev set에서 테스트한 결과
- max_seq_length = 512
- DistilBert, DistilKoBERT의 경우 fine-tuning할 때 추가적으로 Distilation하지 않았습니다

|                         | Exact Match (%) | F1 Score (%) |
| ----------------------- | --------------- | ------------ |
| KoBERT                  | 52.81           | 80.27        |
| DistilKoBERT            | 54.12           | 77.80        |
| Bert-multilingual       | 70.42           | 90.25        |
| DistilBert-multilingual | 64.32           | 84.78        |

## References

- [KoBERT](https://github.com/SKTBrain/KoBERT)
- [Huggingface Transformers](https://github.com/huggingface/transformers)
- [KorQuAD](https://korquad.github.io/category/1.0_KOR.html)
- [KorQuAD by graykode](https://github.com/graykode/KorQuAD-beginner)
- [KorQuAD by lyeoni](https://github.com/lyeoni/KorQuAD)
- [KoBert shows low performance on KorQuad](https://github.com/SKTBrain/KoBERT/issues/1)
