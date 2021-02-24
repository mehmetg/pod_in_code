from airflow.executors import kubernetes_executor
from airflow.plugins_manager import AirflowPlugin


class KubernetesExecutor(kubernetes_executor.KubernetesExecutor):

    def __init__(self):
        super(KubernetesExecutor, self).__init__(self)


class KubernetesExecutorPlugin(AirflowPlugin):
    name = "voleon_kubernetes_plugin"
    executors = [KubernetesExecutor]
    operators = [
        DcosSecretsDirective,
        MesosExecutorConfig,
        MesosVolume,
        get_default_mesos_executor_config,
    ]