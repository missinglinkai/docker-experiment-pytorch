FROM missinglinkai/frameworks:latest

ADD experiment.py experiment.py
ADD mnist_data_loader.py mnist_data_loader.py

RUN python mnist_data_loader.py

RUN python -m pip install -i https://testpypi.python.org/pypi missinglink-sdk

ENV PROJECT_TOKEN=HnHgRzkuOpVNTqMK
ENV OWNER_ID=ffff-cf7d-6501-e583-8c13a14eca0d
ENV HOST=https://missinglink-staging.appspot.com
ENV EPOCHS=10

CMD python experiment.py \
    --owner-id $OWNER_ID \
    --project-token $PROJECT_TOKEN \
    --epochs $EPOCHS \
    --host $HOST
